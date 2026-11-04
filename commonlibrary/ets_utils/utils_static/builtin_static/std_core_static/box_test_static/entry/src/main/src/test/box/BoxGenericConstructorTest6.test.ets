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
  A,
  AandB,
  AddNumObj,
  AandBWithValues,
  AnimalBase,
  AppError,
  DeepL1,
  B,
  Calculator,
  Cat,
  ConcatFn,
  CustomBox,
  DogBase,
  Executable,
  FnNumNumObj,
  FlagRecord,
  IdAndNameType,
  NameAndAge,
  NameAndAgeWithAge,
  KeyValue,
  Named,
  OptionalAB,
  Person,
  PredicateFn,
  Processor,
  SetVoidObj,
  Singleton,
  Transformer,
  User,
  Validator,
  XYZcoords,
} from '../Util.test';
export default function BoxGenericConstructorTest6(): void {
  describe('BoxGenericConstructorTest6', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0010
     * @tc.name testBoxGenericConstructorTestSix001
     * @tc.desc Verify Box.box with Set<string> and has returns true for existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b']);
      const box = Box.box<Set<string>>(set);
      expect(box.get().has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0020
     * @tc.name testBoxGenericConstructorTestSix002
     * @tc.desc Verify Box.box with Set of 500 items has size 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      for (let i = 0; i < 500; i++) {
        set.add(i);
      }
      const box = Box.box<Set<number>>(set);
      expect(box.get().size).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0030
     * @tc.name testBoxGenericConstructorTestSix003
     * @tc.desc Verify Box.box returns same Set reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3]);
      const box = Box.box<Set<number>>(set);
      const storedSet = box.get();
      expect(storedSet).assertEqual(set);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0040
     * @tc.name testBoxGenericConstructorTestSix004
     * @tc.desc Verify Box.box with Date value preserves the stored Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      const box = Box.box<Date>(date);
      expect(box.get().getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0050
     * @tc.name testBoxGenericConstructorTestSix005
     * @tc.desc Verify Box.box with Date preserves full year value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 6, 7);
      const box = Box.box<Date>(date);
      expect(box.get().getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0060
     * @tc.name testBoxGenericConstructorTestSix006
     * @tc.desc Verify Box.box returns same Date reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      const box = Box.box<Date>(date);
      const storedDate = box.get();
      expect(storedDate).assertEqual(date);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0070
     * @tc.name testBoxGenericConstructorTestSix007
     * @tc.desc Verify Box.box with number|undefined stores number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number | undefined>(42);
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0080
     * @tc.name testBoxGenericConstructorTestSix008
     * @tc.desc Verify Box.box with custom class Person preserves name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Person('Bob');
      const box = Box.box<Person>(p);
      expect(box.get().name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0090
     * @tc.name testBoxGenericConstructorTestSix009
     * @tc.desc Verify Box.box with Calculator class method add returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const calc = new Calculator();
      const box = Box.box<Calculator>(calc);
      expect(box.get().add(2, 3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0100
     * @tc.name testBoxGenericConstructorTestSix010
     * @tc.desc Verify Box.box with subclass Cat preserves inherited and own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cat = new Cat();
      const box = Box.box<Cat>(cat);
      expect(box.get().type).assertEqual('animal');
      expect(box.get().sound).assertEqual('meow');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0110
     * @tc.name testBoxGenericConstructorTestSix011
     * @tc.desc Verify Box.box wrapping generic CustomBox preserves inner value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const w = new CustomBox<number>(99);
      const box = Box.box<CustomBox<number>>(w);
      expect(box.get().value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0120
     * @tc.name testBoxGenericConstructorTestSix012
     * @tc.desc Verify Box.box with Singleton instance preserves id property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Singleton.instance;
      const box = Box.box<Singleton>(s);
      expect(box.get().id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0130
     * @tc.name testBoxGenericConstructorTestSix013
     * @tc.desc Verify Box.box with RangeError preserves message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError('Out of range');
      const box = Box.box<RangeError>(err);
      expect(box.get().message).assertEqual('Out of range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0140
     * @tc.name testBoxGenericConstructorTestSix014
     * @tc.desc Verify Box.box with custom AppError preserves erroCode property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new AppError('Not found', 404);
      const box = Box.box<AppError>(err);
      expect(box.get().erroCode).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0150
     * @tc.name testBoxGenericConstructorTestSix015
     * @tc.desc Verify Box.box returns same Error reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error('test');
      const box = Box.box<Error>(err);
      const storedError = box.get();
      expect(storedError).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0160
     * @tc.name testBoxGenericConstructorTestSix016
     * @tc.desc Verify Box.box with arrow function preserves function reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleFn: (x: number) => number = (x: number): number => x * 2;
      const box = Box.box<(x: number) => number>(doubleFn);
      expect(box.get()).assertEqual(doubleFn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0170
     * @tc.name testBoxGenericConstructorTestSix017
     * @tc.desc Verify Box.box with RegExp preserves g flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex = new RegExp('\\d+', 'g');
      const box = Box.box<RegExp>(regex);
      expect(box.get().flags).assertEqual('g');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0180
     * @tc.name testBoxGenericConstructorTestSix018
     * @tc.desc Verify Box.box returns same RegExp reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex = new RegExp('\\w+');
      const box = Box.box<RegExp>(regex);
      expect(box.get()).assertEqual(regex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0190
     * @tc.name testBoxGenericConstructorTestSix019
     * @tc.desc Verify Box.box set method updates the stored number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number>(1);
      box.set(2);
      expect(box.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0200
     * @tc.name testBoxGenericConstructorTestSix020
     * @tc.desc Verify Box.box with typed Box<string> variable preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Box<string> = Box.box<string>('ArkTS');
      const val: string = box.get();
      expect(val).assertEqual('ArkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0210
     * @tc.name testBoxGenericConstructorTestSix021
     * @tc.desc Verify Box.box with single-element array preserves element via index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number[]>([1]);
      const val: number[] = box.get();
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0220
     * @tc.name testBoxGenericConstructorTestSix022
     * @tc.desc Verify Box.box without explicit type argument returns string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box('ArkTS');
      expect(box.get()).assertEqual('ArkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0230
     * @tc.name testBoxGenericConstructorTestSix023
     * @tc.desc Verify Box.box with subclass as parent type preserves reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new B();
      const box = Box.box<A>(b);
      const storedSubclass = box.get();
      expect(storedSubclass).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0240
     * @tc.name testBoxGenericConstructorTestSix024
     * @tc.desc Verify Box.box<string> factory stores 'hello' correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strBox = Box.box<string>('hello');
      expect(strBox.get()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0250
     * @tc.name testBoxGenericConstructorTestSix025
     * @tc.desc Verify Box.box<number> stores the number value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numBox = Box.box<number>(42);
      expect(numBox.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0260
     * @tc.name testBoxGenericConstructorTestSix026
     * @tc.desc Verify Box.box in loop of 100 iterations with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const box = Box.box<number>(i);
        expect(box.get()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0270
     * @tc.name testBoxGenericConstructorTestSix027
     * @tc.desc Verify two Box<number[]> with same array are not reference-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const firstBox = Box.box<number[]>(arr);
      const secondBox = Box.box<number[]>(arr);
      expect(firstBox).not().assertEqual(secondBox);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0280
     * @tc.name testBoxGenericConstructorTestSix028
     * @tc.desc Verify 10 Box instances are independent and set on one does not affect others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes: Box<number>[] = [];
      for (let i = 0; i < 10; i++) {
        boxes.push(Box.box<number>(i));
      }
      for (let i = 0; i < 10; i++) {
        expect(boxes[i]!.get()).assertEqual(i);
      }
      boxes[0]!.set(100);
      expect(boxes[0]!.get()).assertEqual(100);
      expect(boxes[1]!.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0290
     * @tc.name testBoxGenericConstructorTestSix029
     * @tc.desc Verify new Box<string> stores the constructor value a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const constructorBox = new Box<string>('a');
      expect(constructorBox.get()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0300
     * @tc.name testBoxGenericConstructorTestSix030
     * @tc.desc Verify new Box<number> set updates the stored value to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const constructorBox = new Box<number>(0);
      constructorBox.set(10);
      expect(constructorBox.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0310
     * @tc.name testBoxGenericConstructorTestSix031
     * @tc.desc Verify new Box<number> preserves its independent initial value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const constructorBox = new Box<number>(2);
      expect(constructorBox.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0320
     * @tc.name testBoxGenericConstructorTestSix032
     * @tc.desc Verify Box.box with 2D number array preserves nested element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: number[][] = [
        [1, 2],
        [3, 4],
      ];
      const box = Box.box<number[][]>(matrix);
      expect(box.get()[0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0330
     * @tc.name testBoxGenericConstructorTestSix033
     * @tc.desc Verify Box.box with interface-implementing class preserves method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const user = new User();
      const box = Box.box<Named>(user);
      expect(box.get().getName()).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0340
     * @tc.name testBoxGenericConstructorTestSix034
     * @tc.desc Verify Box.box with union type storing number correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string | number>(42);
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0350
     * @tc.name testBoxGenericConstructorTestSix035
     * @tc.desc Verify Box<(x:number)=>number> method-interface constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: FnNumNumObj = { fn: (x: number): number => x * 2 };
      const box = new Box<FnNumNumObj>(obj);
      expect(box.get().fn(5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0360
     * @tc.name testBoxGenericConstructorTestSix036
     * @tc.desc Verify Box with void method interface constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideEffect: number = 0;
      const obj: SetVoidObj = {
        set: (val: number): void => {
          sideEffect = val;
        },
      };
      const box = new Box<SetVoidObj>(obj);
      box.get().set(42);
      expect(sideEffect).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0370
     * @tc.name testBoxGenericConstructorTestSix037
     * @tc.desc Verify Box with predicate method interface constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: PredicateFn = { isPositive: (n: number): boolean => n > 0 };
      const box = new Box<PredicateFn>(obj);
      expect(box.get().isPositive(5)).assertTrue();
      expect(box.get().isPositive(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0380
     * @tc.name testBoxGenericConstructorTestSix038
     * @tc.desc Verify Box with compute method interface constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: AddNumObj = { add: (x: number, y: number): number => x + y };
      const box = new Box<AddNumObj>(obj);
      expect(box.get().add(3, 4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0390
     * @tc.name testBoxGenericConstructorTestSix039
     * @tc.desc Verify Box<Executable> constructor with named interface stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false;
      const obj: Executable = {
        execute: (): void => {
          executed = true;
        },
      };
      const box = new Box<Executable>(obj);
      box.get().execute();
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0400
     * @tc.name testBoxGenericConstructorTestSix040
     * @tc.desc Verify Box<Validator> constructor with validation interface stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Validator = { validate: (s: string): boolean => s.length > 0 };
      const box = new Box<Validator>(obj);
      expect(box.get().validate('abc')).assertTrue();
      expect(box.get().validate('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0410
     * @tc.name testBoxGenericConstructorTestSix041
     * @tc.desc Verify Box with Transformer interface constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Transformer = { transform: (input: number): number => input * input };
      const box = new Box<Transformer>(obj);
      expect(box.get().transform(4)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0420
     * @tc.name testBoxGenericConstructorTestSix042
     * @tc.desc Verify Box<Box<number[]>> nested array box constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerBox = new Box<number[]>([1, 2, 3]);
      const outerBox = new Box<Box<number[]>>(innerBox);
      const storedInnerBox = outerBox.get();
      const innerArray = storedInnerBox.get();
      expect(innerArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0430
     * @tc.name testBoxGenericConstructorTestSix043
     * @tc.desc Verify Record with 10 box entries stores correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, Box<number>> = {};
      for (let i = 0; i < 10; i++) {
        rec[`k${i}`] = new Box<number>(i);
      }
      const box = new Box<Record<string, Box<number>>>(rec);
      expect(box.get()['k0']!.get()).assertEqual(0);
      expect(box.get()['k9']!.get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0440
     * @tc.name testBoxGenericConstructorTestSix044
     * @tc.desc Verify Map<Box<string>,int> with 3 entries stores size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Box<string>, number>();
      const firstKeyBox: Box<string> = new Box<string>('a');
      const secondKeyBox: Box<string> = new Box<string>('b');
      const thirdKeyBox: Box<string> = new Box<string>('c');
      map.set(firstKeyBox, 1);
      map.set(secondKeyBox, 2);
      map.set(thirdKeyBox, 3);
      const box = new Box<Map<Box<string>, number>>(map);
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0450
     * @tc.name testBoxGenericConstructorTestSix045
     * @tc.desc Verify Box<Promise<Box<number[]>>> constructor with array promise stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise: Promise<Box<number[]>> = Promise.resolve(new Box<number[]>([1, 2, 3]));
      const box = new Box<Promise<Box<number[]>>>(promise);
      expect(box.get()).assertEqual(promise);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0460
     * @tc.name testBoxGenericConstructorTestSix046
     * @tc.desc Verify Box<(n:number)=>boolean> constructor with predicate fn stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: (n: number) => boolean = (n: number): boolean => n % 2 === 0;
      const box = new Box<(n: number) => boolean>(fn);
      expect(box.get()).assertEqual(fn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0470
     * @tc.name testBoxGenericConstructorTestSix047
     * @tc.desc Verify Box<NameAndAge> intersection constructor stores name and id correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NameAndAge = { name: 'Alice', id: 30 };
      const box = new Box<NameAndAge>(obj);
      expect(box.get().name).assertEqual('Alice');
      expect(box.get().id).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0480
     * @tc.name testBoxGenericConstructorTestSix048
     * @tc.desc Verify Box<{x:number}&{y:number}&{z:number}> triple intersection stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: XYZcoords = { x: 1, y: 2, z: 3 };
      const box = new Box<XYZcoords>(obj);
      expect(box.get().x).assertEqual(1);
      expect(box.get().y).assertEqual(2);
      expect(box.get().z).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0490
     * @tc.name testBoxGenericConstructorTestSix049
     * @tc.desc Verify Box.box<AandB> static factory intersection stores id and name correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: AandB = { id: 10, name: 'test' };
      const box = Box.box<AandB>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0500
     * @tc.name testBoxGenericConstructorTestSix050
     * @tc.desc Verify Box<{id:number}&{name:string}> intersection with id and name stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: IdAndNameType = { id: 100, name: 'item' };
      const box = new Box<IdAndNameType>(obj);
      expect(box.get().id).assertEqual(100);
      expect(box.get().name).assertEqual('item');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0510
     * @tc.name testBoxGenericConstructorTestSix051
     * @tc.desc Verify Box<boolean[]> constructor with 10000-element array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i % 2 === 0);
      }
      const box = new Box<boolean[]>(arr);
      expect(box.get().length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0520
     * @tc.name testBoxGenericConstructorTestSix052
     * @tc.desc Verify Box<number[][]> with large 2D array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: number[][] = [];
      for (let i = 0; i < 100; i++) {
        let row: number[] = [];
        for (let j = 0; j < 100; j++) {
          row.push(i * j);
        }
        matrix.push(row);
      }
      const box = new Box<number[][]>(matrix);
      expect(box.get().length).assertEqual(100);
      expect(box.get()[0].length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0530
     * @tc.name testBoxGenericConstructorTestSix053
     * @tc.desc Verify Box<Date> constructor with timestamp 0 stores epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const box = new Box<Date>(date);
      expect(box.get().getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0540
     * @tc.name testBoxGenericConstructorTestSix054
     * @tc.desc Verify Box<RangeError> constructor with RangeError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError('range error');
      const box = new Box<RangeError>(err);
      expect(box.get().message).assertEqual('range error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0550
     * @tc.name testBoxGenericConstructorTestSix055
     * @tc.desc Verify Box<TypeError> constructor with TypeError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new TypeError('type error');
      const box = new Box<TypeError>(err);
      expect(box.get().message).assertEqual('type error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0560
     * @tc.name testBoxGenericConstructorTestSix056
     * @tc.desc Verify Box<EvalError> constructor with EvalError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new EvalError('eval error');
      const box = new Box<EvalError>(err);
      expect(box.get().message).assertEqual('eval error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0570
     * @tc.name testBoxGenericConstructorTestSix057
     * @tc.desc Verify Box<SyntaxError> constructor with SyntaxError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new SyntaxError('syntax error');
      const box = new Box<SyntaxError>(err);
      expect(box.get().message).assertEqual('syntax error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0580
     * @tc.name testBoxGenericConstructorTestSix058
     * @tc.desc Verify Box<ReferenceError> constructor with ReferenceError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new ReferenceError('ref error');
      const box = new Box<ReferenceError>(err);
      expect(box.get().message).assertEqual('ref error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0590
     * @tc.name testBoxGenericConstructorTestSix059
     * @tc.desc Verify Box<URIError> constructor with URIError stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new URIError('uri error');
      const box = new Box<URIError>(err);
      expect(box.get().message).assertEqual('uri error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0600
     * @tc.name testBoxGenericConstructorTestSix060
     * @tc.desc Verify Box<{a?:string,b?:number}> with only b set stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: OptionalAB = { b: 10 };
      const box = new Box<OptionalAB>(obj);
      expect(box.get().b).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0610
     * @tc.name testBoxGenericConstructorTestSix061
     * @tc.desc Verify Box<Processor> constructor with named interface method stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Processor = { process: (items: number[]): number[] => items.map((x: number): number => x * 2) };
      const box = new Box<Processor>(obj);
      expect(box.get().process([1, 2, 3])[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0620
     * @tc.name testBoxGenericConstructorTestSix062
     * @tc.desc Verify Box<Map<string,Promise<Box<number>>>> with complex nested type stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerMap = new Map<string, Promise<Box<number>>>();
      const innerBox: Box<number> = new Box<number>(42);
      const resolvedBox: Promise<Box<number>> = Promise.resolve(innerBox);
      innerMap.set('a', resolvedBox);
      const box = new Box<Map<string, Promise<Box<number>>>>(innerMap);
      expect(box.get().size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0630
     * @tc.name testBoxGenericConstructorTestSix063
     * @tc.desc Verify Box<Box<string>> default constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Box<string>>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0640
     * @tc.name testBoxGenericConstructorTestSix064
     * @tc.desc Verify Box<()=>string> default constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<() => string>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0650
     * @tc.name testBoxGenericConstructorTestSix065
     * @tc.desc Verify Box<{a?:string,b?:number}> default constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<OptionalAB>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0660
     * @tc.name testBoxGenericConstructorTestSix066
     * @tc.desc Verify Box<ConcatFn> constructor with named interface object stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ConcatFn = { concat: (a: string, b: string): string => a + b };
      const box = new Box<ConcatFn>(obj);
      expect(box.get().concat('x', 'y')).assertEqual('xy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0670
     * @tc.name testBoxGenericConstructorTestSix067
     * @tc.desc Verify Box<EvalError> constructor preserves name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new EvalError('eval');
      const box = new Box<EvalError>(err);
      expect(box.get().name).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0680
     * @tc.name testBoxGenericConstructorTestSix068
     * @tc.desc Verify Box.box<string> preserves a 100000-character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 'x'.repeat(100000);
      const box = Box.box<string>(value);
      expect(box.get().length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0690
     * @tc.name testBoxGenericConstructorTestSix069
     * @tc.desc Verify Box.box<number[][]> preserves row and column values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number[][] = [
        [1, 2],
        [3, 4],
      ];
      const box = Box.box<number[][]>(value);
      expect(box.get()[0][1]).assertEqual(2);
      expect(box.get()[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0700
     * @tc.name testBoxGenericConstructorTestSix070
     * @tc.desc Verify Box.box<Map<string,number>> preserves a missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('present', 1);
      const box = Box.box<Map<string, number>>(map);
      expect(box.get().has('missing')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0710
     * @tc.name testBoxGenericConstructorTestSix071
     * @tc.desc Verify Box.box<Map<number,string>> retrieves a numeric key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>();
      map.set(7, 'seven');
      const box = Box.box<Map<number, string>>(map);
      expect(box.get().get(7)).assertEqual('seven');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0720
     * @tc.name testBoxGenericConstructorTestSix072
     * @tc.desc Verify Box.box<Set<number>> preserves insertion membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([2, 4, 6]);
      const box = Box.box<Set<number>>(set);
      expect(box.get().has(4)).assertTrue();
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0730
     * @tc.name testBoxGenericConstructorTestSix073
     * @tc.desc Verify Box.box<Set<string>> removes duplicate input elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['alpha', 'alpha', 'beta']);
      const box = Box.box<Set<string>>(set);
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0740
     * @tc.name testBoxGenericConstructorTestSix074
     * @tc.desc Verify Box.box<Record<string,number>> preserves fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = { 'left': 1, 'right': 2 };
      const box = Box.box<Record<string, number>>(record);
      expect(box.get()['right']).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0750
     * @tc.name testBoxGenericConstructorTestSix075
     * @tc.desc Verify Box.box<Record<string,string>> preserves empty fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = { 'name': 'Alice', 'note': '' };
      const box = Box.box<Record<string, string>>(record);
      expect(box.get()['note']).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0760
     * @tc.name testBoxGenericConstructorTestSix076
     * @tc.desc Verify Box.box<Date> preserves the date month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 7, 25);
      const box = Box.box<Date>(date);
      expect(box.get().getMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0770
     * @tc.name testBoxGenericConstructorTestSix077
     * @tc.desc Verify Box.box<Error> preserves error message text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error = new Error('factory-error');
      const box = Box.box<Error>(error);
      expect(box.get().message).assertEqual('factory-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0780
     * @tc.name testBoxGenericConstructorTestSix078
     * @tc.desc Verify Box.box<Box<number>> preserves nested factory value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Box.box<number>(88);
      const outer = Box.box<Box<number>>(inner);
      expect(outer.get().get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0790
     * @tc.name testBoxGenericConstructorTestSix079
     * @tc.desc Verify Box.box<Box<string>> preserves nested string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Box.box<string>('nested');
      const outer = Box.box<Box<string>>(inner);
      expect(outer.get().get()).assertEqual('nested');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0800
     * @tc.name testBoxGenericConstructorTestSix080
     * @tc.desc Verify Box.box<Box<number[]>> preserves nested array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Box.box<number[]>([1, 2, 3]);
      const outer = Box.box<Box<number[]>>(inner);
      expect(outer.get().get().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0810
     * @tc.name testBoxGenericConstructorTestSix081
     * @tc.desc Verify Box.box<Box<string[]>> preserves nested array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Box.box<string[]>(['a', 'b']);
      const outer = Box.box<Box<string[]>>(inner);
      expect(outer.get().get()[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0820
     * @tc.name testBoxGenericConstructorTestSix082
     * @tc.desc Verify Box.box<number[]> preserves sparse logical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number[] = [0, -1, 1, 100];
      const box = Box.box<number[]>(value);
      expect(box.get()[1]).assertEqual(-1);
      expect(box.get()[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0830
     * @tc.name testBoxGenericConstructorTestSix083
     * @tc.desc Verify Box.box<boolean[]> preserves boolean order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: boolean[] = [true, false, true];
      const box = Box.box<boolean[]>(value);
      expect(box.get()[0]).assertTrue();
      expect(box.get()[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0840
     * @tc.name testBoxGenericConstructorTestSix084
     * @tc.desc Verify Box.box<string|undefined> preserves undefined input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string | undefined>(undefined);
      expect(box.get()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0850
     * @tc.name testBoxGenericConstructorTestSix085
     * @tc.desc Verify Box.box<number> preserves negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number>(-0.0);
      expect(box.get()).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0860
     * @tc.name testBoxGenericConstructorTestSix086
     * @tc.desc Verify Box.box<number> preserves positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number>(Double.POSITIVE_INFINITY);
      expect(box.get()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0870
     * @tc.name testBoxGenericConstructorTestSix087
     * @tc.desc Verify Box.box<Record<number,string>> preserves numeric field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Record<number, string> = { 0: 'zero', 2: 'two' };
      const box = Box.box<Record<number, string>>(value);
      expect(box.get()[2]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0880
     * @tc.name testBoxGenericConstructorTestSix088
     * @tc.desc Verify Box.box<Map<string,Set<number>>> preserves nested membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([2, 4]);
      const map = new Map<string, Set<number>>();
      map.set('values', set);
      const box = Box.box<Map<string, Set<number>>>(map);
      expect(box.get().get('values')!.has(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0890
     * @tc.name testBoxGenericConstructorTestSix089
     * @tc.desc Verify Box.box<Map<string,number[]>> preserves nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number[]>();
      const values: number[] = [3, 6, 9];
      map.set('values', values);
      const box = Box.box<Map<string, number[]>>(map);
      expect(box.get().get('values')![2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0900
     * @tc.name testBoxGenericConstructorTestSix090
     * @tc.desc Verify Box.box<Set<Box<number>>> preserves boxed membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Box<number>(1);
      const second = new Box<number>(2);
      const set = new Set<Box<number>>([first, second]);
      const box = Box.box<Set<Box<number>>>(set);
      expect(box.get().size).assertEqual(2);
      expect(box.get().has(first)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0910
     * @tc.name testBoxGenericConstructorTestSix091
     * @tc.desc Verify Box.box<Array<Box<string>>> preserves boxed array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Box<string>[] = [new Box<string>('a'), new Box<string>('b')];
      const box = Box.box<Box<string>[]>(value);
      expect(box.get()[1].get()).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0920
     * @tc.name testBoxGenericConstructorTestSix092
     * @tc.desc Verify Box.box<string[]> preserves a long element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: string[] = ['a'.repeat(100), 'b'];
      const box = Box.box<string[]>(value);
      expect(box.get()[0].length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0930
     * @tc.name testBoxGenericConstructorTestSix093
     * @tc.desc Verify Box.box<number[]> preserves negative and zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number[]>([-2, 0, 2]);
      expect(box.get()[0]).assertEqual(-2);
      expect(box.get()[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0940
     * @tc.name testBoxGenericConstructorTestSix094
     * @tc.desc Verify Box.box<boolean> factory preserves false input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<boolean>(false);
      expect(box.get()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0950
     * @tc.name testBoxGenericConstructorTestSix095
     * @tc.desc Verify Box.box<string> factory preserves a newline value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string>('line1\nline2');
      expect(box.get().length).assertEqual(11);
      expect(box.get().charAt(5).toString()).assertEqual('\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0960
     * @tc.name testBoxGenericConstructorTestSix096
     * @tc.desc Verify Box<{name:string}&{age:number}> intersection constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NameAndAgeWithAge = { name: 'Alice', age: 30 };
      const box = new Box<NameAndAgeWithAge>(obj);
      expect(box.get().name).assertEqual('Alice');
      expect(box.get().age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0970
     * @tc.name testBoxGenericConstructorTestSix097
     * @tc.desc Verify Box.box<{a:number}&{b:string}> static factory intersection stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: AandBWithValues = { a: 10, b: 'test' };
      const box = Box.box<AandBWithValues>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0980
     * @tc.name testBoxGenericConstructorTestSix098
     * @tc.desc Verify Box<Record> with nested key-value entry stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = {};
      const level0Val: KeyValue = { key: 'deep' };
      obj['level0'] = level0Val;
      const box = new Box<Record<string, Object>>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_0990
     * @tc.name testBoxGenericConstructorTestSix099
     * @tc.desc Verify set(100) on default Box<number> updates, other box get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number>();
      const secondBox = new Box<number>();
      firstBox.set(100);
      expect(firstBox.get()).assertEqual(100);
      try {
        secondBox.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_1000
     * @tc.name testBoxGenericConstructorTestSix100
     * @tc.desc Verify array literal of two Box<string> instances has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes: Box<string>[] = [new Box<string>('a'), new Box<string>('b')];
      expect(boxes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_1010
     * @tc.name testBoxGenericConstructorTestSix101
     * @tc.desc Verify Box.box<L1>() with deeply nested object stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: DeepL1 = { l1: { l2: { l3: 'deep' } } };
      const box = Box.box<DeepL1>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_SIX_1020
     * @tc.name testBoxGenericConstructorTestSix102
     * @tc.desc Verify Box.box<number[][]>() with 2D array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestSix102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number[][]>([
        [1, 2],
        [3, 4],
      ]);
      const result = box.get();
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual(4);
    });
  });
}
