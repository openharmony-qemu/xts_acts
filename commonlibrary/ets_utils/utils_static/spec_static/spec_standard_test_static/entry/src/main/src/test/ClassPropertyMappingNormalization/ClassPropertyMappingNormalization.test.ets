'use static'
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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../hypium/index";

interface IBalance1 {
  balance: int
}

class BalanceImpl1 implements IBalance1 {
  balance: int = 100
}

interface IAnimal2 {
  name: string
}

class Animal2 implements IAnimal2 {
  name: string = "Animal"
}

class Dog2 extends Animal2 {
  name: string = "Dog"
}

interface IReadOnly3 {
  readonly r: int
}

class ReadonlyImpl3 implements IReadOnly3 {
  readonly r: int = 42
}

class DerivedReadonly3 extends ReadonlyImpl3 {
  readonly r: int = 100
}

interface ICallback4 {
  cb: (x: int) => int
}

class CallbackImpl4 implements ICallback4 {
  cb: (x: int) => int = (x: int) => x + 1
}

interface IX5 {
  x: int
}

interface IY5 {
  y: int
}

class XYImpl5 implements IX5,IY5 {
  x: int = 1
  y: int = 2
}

interface IName6 {
  name: string
}

class Animal6 implements IName6 {
  name: string = "Animal"
}

class Dog6 extends Animal6 {
  name: string = "Dog"
}

interface ICounter7 {
  count: int
}

class CounterImpl7 implements ICounter7 {
  count: int = 0
}

let items: Array<ICounter7> = [new CounterImpl7(), new CounterImpl7(), new CounterImpl7()];

export default function classPropertyMappingNormalizationTest(): void {
  describe('classPropertyMappingNormalizationTest', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0100
     * @tc.name ClassPropertyMappingNormalizationTest001
     * @tc.desc Verify that fields of different types have consistent access behavior, including direct read/write access and getter/setter calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i: IBalance1 = new BalanceImpl1();
      expect(i.balance).assertEqual(100);
      i.balance = 250;
      expect(i.balance).assertEqual(250);
      let impl = i as BalanceImpl1;
      expect(impl.balance).assertEqual(250);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0200
     * @tc.name ClassPropertyMappingNormalizationTest002
     * @tc.desc Verify that in inheritance scenarios, when accessing a property through an interface reference, the implicit getter is called to read the parent class field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let d = new Dog2()
      let a: Animal2 = d
      let i: IAnimal2 = d
      expect(d.name).assertEqual("Dog");
      expect(a.name).assertEqual("Dog");
      expect(i.name).assertEqual("Dog");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0300
     * @tc.name ClassPropertyMappingNormalizationTest003
     * @tc.desc Verify that when an interface property is readonly, the compiler only generates a getter, and writing has no effect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i1: IReadOnly3 = new ReadonlyImpl3();
      expect(i1.r).assertEqual(42);
      let i2: IReadOnly3 = new DerivedReadonly3(); 
      expect(i2.r).assertEqual(100);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0400
     * @tc.name ClassPropertyMappingNormalizationTest004
     * @tc.desc Verify that after writing to a property through an interface reference, the class instance reads the same field value consistently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i: ICallback4 = new CallbackImpl4();
      expect(i.cb(1)).assertEqual(2);
      i.cb = (x: int) => x * 3;
      expect(i.cb(2)).assertEqual(6);
      let impl = i as CallbackImpl4;
      expect(impl.cb(3)).assertEqual(9);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0500
     * @tc.name ClassPropertyMappingNormalizationTest005
     * @tc.desc Verify that after writing to a property through an interface reference, the implicit setter is called to update the class field value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let c = new XYImpl5();
      let ix: IX5 = c;
      let iy: IY5 = c;
      expect(ix.x).assertEqual(1);
      expect(iy.y).assertEqual(2);
      ix.x = 10;
      iy.y = 20;
      expect(ix.x).assertEqual(10);
      expect(iy.y).assertEqual(20);
      expect(c.x).assertEqual(10);
      expect(c.y).assertEqual(20);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0600
     * @tc.name ClassPropertyMappingNormalizationTest006
     * @tc.desc Verify that when writing to a field through a class instance, the value is correctly updated and can be read back for verification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let d: Dog6 = new Dog6();
      let a: IName6 = d;
      expect(a.name).assertEqual("Dog");
      a.name = "Cat";
      expect(d.name).assertEqual("Cat");
      expect(a.name).assertEqual("Cat");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSPROPERTYMAPPINGNORMALIZATION_0700
     * @tc.name ClassPropertyMappingNormalizationTest007
     * @tc.desc When reading a field through a class instance, the direct access operation returns the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('ClassPropertyMappingNormalizationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < items.length; i++) {
        items[i].count = i * 10;
      }
      
      for (let i = 0; i < items.length; i++) {
        expect(items[i].count).assertEqual(i * 10);
      }
    })
  })
}
