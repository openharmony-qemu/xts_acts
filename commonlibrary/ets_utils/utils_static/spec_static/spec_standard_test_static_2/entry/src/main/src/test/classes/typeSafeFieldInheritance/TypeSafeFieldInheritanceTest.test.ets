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
} from "../../../../../hypium";

class FieldInheritPass001Base {
  field: int = 1
}

class FieldInheritPass001Derived extends FieldInheritPass001Base {
  override field: int = 2
}

class FieldInheritPass002Base {
  field: string = 'base'
}

class FieldInheritPass002Derived extends FieldInheritPass002Base {
  field: string = 'derived'
}

class FieldInheritPass003Base {
  protected field: int = 3
}

class FieldInheritPass003Derived extends FieldInheritPass003Base {
  protected override field: int = 4

  getField(): int {
    return this.field
  }
}

class FieldInheritPass004Base {
  field: Object = 1
}

class FieldInheritPass004Derived extends FieldInheritPass004Base {
  override field: Object

  constructor() {
    super()
    this.field = 'derived'
  }
}

interface FieldInheritPass005Interface {
  field: int
}

class FieldInheritPass005Base {
  field: int = 5
}

class FieldInheritPass005Derived extends FieldInheritPass005Base implements FieldInheritPass005Interface {
  override field: int = 6
}

interface FieldInheritPass006Interface {
  field: string
}

class FieldInheritPass006Base implements FieldInheritPass006Interface {
  field: string = 'base'
}

class FieldInheritPass006Derived extends FieldInheritPass006Base {}

class FieldInheritPass007Base {
  readonly field: int = 7
}

class FieldInheritPass007Derived extends FieldInheritPass007Base {
  override readonly field: int = 8
}

class FieldInheritPass008Base<T> {
  field: T

  constructor(value: T) {
    this.field = value
  }
}

class FieldInheritPass008Derived<U> extends FieldInheritPass008Base<U> {
  override field: U

  constructor(value: U) {
    super(value)
    this.field = value
  }
}

class FieldInheritPass009Base {
  field?: int = 9
}

class FieldInheritPass009Derived extends FieldInheritPass009Base {
  override field?: int = 10
}

class FieldInheritPass010Base {
  field: int | string = 10
}

class FieldInheritPass010Derived extends FieldInheritPass010Base {
  override field: int | string = 'ten'
}

class FieldInheritPass011Root {
  field: int = 11
}

class FieldInheritPass011Middle extends FieldInheritPass011Root {
  override field: int = 12
}

class FieldInheritPass011Leaf extends FieldInheritPass011Middle {
  override field: int = 13
}

interface FieldInheritPass012I1 {
  field: int
}

interface FieldInheritPass012I2 {
  field: int
}

class FieldInheritPass012Class implements FieldInheritPass012I1, FieldInheritPass012I2 {
  field: int = 12
}

interface FieldInheritPass013Interface {
  readonly field: int
}

class FieldInheritPass013Class implements FieldInheritPass013Interface {
  field: int = 13
}

interface FieldInheritPass014Interface {
  readonly field: int
}

class FieldInheritPass014Class implements FieldInheritPass014Interface {
  readonly field: int = 14
}

interface FieldInheritPass015Interface {
  get field(): int
}

class FieldInheritPass015Class implements FieldInheritPass015Interface {
  field: int = 15
}

interface FieldInheritPass016Interface {
  set field(value: int)
}

class FieldInheritPass016Class implements FieldInheritPass016Interface {
  field: int = 0
}

interface FieldInheritPass017Interface {
  field?: int
}

class FieldInheritPass017Class implements FieldInheritPass017Interface {}

interface FieldInheritPass018Interface {
  field?: int
}

class FieldInheritPass018Class implements FieldInheritPass018Interface {
  field?: int = 18
}

class FieldInheritPass019Base {
  field!: int
}

class FieldInheritPass019Derived extends FieldInheritPass019Base {
  override field!: int

  constructor() {
    super()
    this.field = 19
  }
}

class FieldInheritPass020Base {
  field: string | null = null
}

class FieldInheritPass020Derived extends FieldInheritPass020Base {
  override field: string | null = 'twenty'
}

class FieldInheritPass021Box<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

class FieldInheritPass021Base {
  field: FieldInheritPass021Box<string> = new FieldInheritPass021Box<string>('base')
}

class FieldInheritPass021Derived extends FieldInheritPass021Base {
  override field: FieldInheritPass021Box<string> = new FieldInheritPass021Box<string>('derived')
}

class FieldInheritPass022Base {
  field: string[] = ['base']
}

class FieldInheritPass022Derived extends FieldInheritPass022Base {
  override field: string[] = ['derived']
}

class FieldInheritPass023Base {
  field: [int, string] = [23, 'base']
}

class FieldInheritPass023Derived extends FieldInheritPass023Base {
  override field: [int, string] = [24, 'derived']
}

class FieldInheritPass024Base {
  field: int = 24
}

class FieldInheritPass024Derived extends FieldInheritPass024Base {
  override field!: int

  constructor() {
    super()
    this.field = 25
  }
}

class FieldInheritPass025Base {
  field!: int

  constructor() {
    this.field = 25
  }
}

class FieldInheritPass025Derived extends FieldInheritPass025Base {
  override field: int = 26
}

class FieldInheritPass026Base {
  static field: int = 26
}

class FieldInheritPass026Derived extends FieldInheritPass026Base {
  field: int = 27
}

class FieldInheritPass027Base {
  field: int = 27
}

class FieldInheritPass027Derived extends FieldInheritPass027Base {
  static field: int = 28
}

export default function TypeSafeFieldInheritance(): void {
  describe('TypeSafeFieldInheritance', () => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0100
     * @tc.name TypeSafeFieldInheritance001
     * @tc.desc test explicit override of public field with same type in derived class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let d: FieldInheritPass001Derived = new FieldInheritPass001Derived()
      expect(d.field).assertEqual(2)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0200
     * @tc.name TypeSafeFieldInheritance002
     * @tc.desc test implicit override of public field with same type in derived class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let d: FieldInheritPass002Derived = new FieldInheritPass002Derived()
      expect(d.field).assertEqual('derived')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0300
     * @tc.name TypeSafeFieldInheritance003
     * @tc.desc test protected field override with same access modifier and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass003Derived().getField()).assertEqual(4)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0400
     * @tc.name TypeSafeFieldInheritance004
     * @tc.desc test override field initialized in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass004Derived().field).assertEqual('derived')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0500
     * @tc.name TypeSafeFieldInheritance005
     * @tc.desc test class field implements interface property and overrides base class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass005Value: FieldInheritPass005Interface = new FieldInheritPass005Derived()
      expect(pass005Value.field).assertEqual(6)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0600
     * @tc.name TypeSafeFieldInheritance006
     * @tc.desc test inherited interface property field accessed through interface reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass006Value: FieldInheritPass006Interface = new FieldInheritPass006Derived()
      expect(pass006Value.field).assertEqual('base')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0700
     * @tc.name TypeSafeFieldInheritance007
     * @tc.desc test readonly field override with same readonly modifier and same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass007Derived().field).assertEqual(8)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0800
     * @tc.name TypeSafeFieldInheritance008
     * @tc.desc test generic field override with same type substitution in derived generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass008Value: FieldInheritPass008Derived<string> = new FieldInheritPass008Derived<string>('generic')
      expect(pass008Value.field).assertEqual('generic')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_0900
     * @tc.name TypeSafeFieldInheritance009
     * @tc.desc test optional field override with same optional modifier and same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass009Derived().field).assertEqual(10)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1000
     * @tc.name TypeSafeFieldInheritance010
     * @tc.desc test union type field override with exact same union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass010Derived().field).assertEqual('ten')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1100
     * @tc.name TypeSafeFieldInheritance011
     * @tc.desc test multilevel field override through three levels of inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass011Leaf().field).assertEqual(13)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1200
     * @tc.name TypeSafeFieldInheritance012
     * @tc.desc test class implementing two interfaces with same property type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass012Class().field).assertEqual(12)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1300
     * @tc.name TypeSafeFieldInheritance013
     * @tc.desc test writable field implements readonly interface property, modification visible via interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass013Class: FieldInheritPass013Class = new FieldInheritPass013Class()
      let pass013Interface: FieldInheritPass013Interface = pass013Class
      pass013Class.field = 14
      expect(pass013Interface.field).assertEqual(14)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1400
     * @tc.name TypeSafeFieldInheritance014
     * @tc.desc test readonly field implements readonly interface property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass014Interface: FieldInheritPass014Interface = new FieldInheritPass014Class()
      expect(pass014Interface.field).assertEqual(14)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1500
     * @tc.name TypeSafeFieldInheritance015
     * @tc.desc test class field implements getter-only interface property, modification visible via interface getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass015Class: FieldInheritPass015Class = new FieldInheritPass015Class()
      let pass015Interface: FieldInheritPass015Interface = pass015Class
      pass015Class.field = 16
      expect(pass015Interface.field).assertEqual(16)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1600
     * @tc.name TypeSafeFieldInheritance016
     * @tc.desc test class field implements setter-only interface property, write via interface setter visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass016Class: FieldInheritPass016Class = new FieldInheritPass016Class()
      let pass016Interface: FieldInheritPass016Interface = pass016Class
      pass016Interface.field = 16
      expect(pass016Class.field).assertEqual(16)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1700
     * @tc.name TypeSafeFieldInheritance017
     * @tc.desc test optional interface property uses default implementation, value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass017Value: FieldInheritPass017Interface = new FieldInheritPass017Class()
      expect(pass017Value.field).assertEqual(undefined)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1800
     * @tc.name TypeSafeFieldInheritance018
     * @tc.desc test optional interface property implemented by optional field with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass018Value: FieldInheritPass018Interface = new FieldInheritPass018Class()
      expect(pass018Value.field).assertEqual(18)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_1900
     * @tc.name TypeSafeFieldInheritance019
     * @tc.desc test late-init field override with same type, initialized in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass019Derived().field).assertEqual(19)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2000
     * @tc.name TypeSafeFieldInheritance020
     * @tc.desc test nullable type field override with exact same nullable type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass020Derived().field).assertEqual('twenty')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2100
     * @tc.name TypeSafeFieldInheritance021
     * @tc.desc test generic class instance field override with exact same parameterized type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass021Derived().field.value).assertEqual('derived')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2200
     * @tc.name TypeSafeFieldInheritance022
     * @tc.desc test array type field override with exact same array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass022Derived().field[0]).assertEqual('derived')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2300
     * @tc.name TypeSafeFieldInheritance023
     * @tc.desc test tuple type field override with exact same tuple type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass023Derived().field[1]).assertEqual('derived')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2400
     * @tc.name TypeSafeFieldInheritance024
     * @tc.desc test late-init field overrides normal field, initialized in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass024Derived().field).assertEqual(25)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2500
     * @tc.name TypeSafeFieldInheritance025
     * @tc.desc test normal field overrides late-init field with initializer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(new FieldInheritPass025Derived().field).assertEqual(26)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2600
     * @tc.name TypeSafeFieldInheritance026
     * @tc.desc test static field in base coexists with instance field of same name in derived
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass026Value: FieldInheritPass026Derived = new FieldInheritPass026Derived()
      expect(FieldInheritPass026Base.field).assertEqual(26)
      expect(pass026Value.field).assertEqual(27)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCE_2700
     * @tc.name TypeSafeFieldInheritance027
     * @tc.desc test instance field in base coexists with static field of same name in derived
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pass027Value: FieldInheritPass027Base = new FieldInheritPass027Derived()
      expect(pass027Value.field).assertEqual(27)
      expect(FieldInheritPass027Derived.field).assertEqual(28)
    })
  })
}
