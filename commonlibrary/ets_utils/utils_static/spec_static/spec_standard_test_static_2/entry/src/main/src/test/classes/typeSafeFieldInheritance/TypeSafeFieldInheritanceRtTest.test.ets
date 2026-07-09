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
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test'

class FieldInheritRt001Base {
  field: Object = 5
}

class FieldInheritRt001Derived extends FieldInheritRt001Base {
  override field: Object = 'abc'
}

class FieldInheritRt002Base {
  field: Object = 'base'
}

class FieldInheritRt002Derived extends FieldInheritRt002Base {
  override field: Object = 'derived'
}

interface FieldInheritRt003Interface {
  field: Object
}

class FieldInheritRt003Base implements FieldInheritRt003Interface {
  field: Object = 'base'
}

class FieldInheritRt003Derived extends FieldInheritRt003Base {
  override field: Object = 'derived'
}

class FieldInheritRt004Trace {
  static value: string = ''

  static add(value: string): int {
    FieldInheritRt004Trace.value += value
    return 1
  }
}

class FieldInheritRt004Base {
  field: int = FieldInheritRt004Trace.add('B')
}

class FieldInheritRt004Derived extends FieldInheritRt004Base {
  override field: int = FieldInheritRt004Trace.add('D') + 1
}

interface FieldInheritRt005Interface {
  field: Object
}

class FieldInheritRt005Base implements FieldInheritRt005Interface {
  field: Object = 'base'
}

class FieldInheritRt005Derived extends FieldInheritRt005Base {
  override field: Object = 'derived'
}

class FieldInheritRt006Root {
  field: Object = 'root'
}

class FieldInheritRt006Middle extends FieldInheritRt006Root {}

class FieldInheritRt006Leaf extends FieldInheritRt006Middle {
  override field: Object = 'leaf'
}

export default function TypeSafeFieldInheritanceRt(): void {
  describe('TypeSafeFieldInheritanceRt', () => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0100
     * @tc.name TypeSafeFieldInheritanceRt001
     * @tc.desc test derived field value is consistent when read through both derived and base references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rt001Derived: FieldInheritRt001Derived = new FieldInheritRt001Derived()
      let rt001Base: FieldInheritRt001Base = rt001Derived
      expect(rt001Derived.field).assertEqual('abc')
      expect(rt001Base.field).assertEqual('abc')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0200
     * @tc.name TypeSafeFieldInheritanceRt002
     * @tc.desc test write through base reference updates the overridden field visible from derived reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rt002Derived: FieldInheritRt002Derived = new FieldInheritRt002Derived()
      let rt002Base: FieldInheritRt002Base = rt002Derived
      rt002Base.field = 20
      expect(rt002Base.field).assertEqual(20)
      expect(rt002Derived.field).assertEqual(20)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0300
     * @tc.name TypeSafeFieldInheritanceRt003
     * @tc.desc test field value consistency across derived class, base class, and interface references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rt003Derived: FieldInheritRt003Derived = new FieldInheritRt003Derived()
      let rt003Interface: FieldInheritRt003Interface = rt003Derived
      expect(rt003Derived.field).assertEqual('derived')
      expect(rt003Interface.field).assertEqual('derived')
      rt003Interface.field = 30
      expect(rt003Derived.field).assertEqual(30)
      expect(rt003Interface.field).assertEqual(30)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0400
     * @tc.name TypeSafeFieldInheritanceRt004
     * @tc.desc test initializer execution order: base initializer runs before derived initializer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      FieldInheritRt004Trace.value = ''
      let rt004Value: FieldInheritRt004Derived = new FieldInheritRt004Derived()
      expect(FieldInheritRt004Trace.value).assertEqual('BD')
      expect(rt004Value.field).assertEqual(2)
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0500
     * @tc.name TypeSafeFieldInheritanceRt005
     * @tc.desc test field consistency after cast from base to derived and write through interface reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rt005Base: FieldInheritRt005Base = new FieldInheritRt005Derived()
      let rt005Derived: FieldInheritRt005Derived = rt005Base as FieldInheritRt005Derived
      let rt005Interface: FieldInheritRt005Interface = rt005Derived
      rt005Interface.field = 'updated'
      expect(rt005Base.field).assertEqual('updated')
      expect(rt005Derived.field).assertEqual('updated')
      expect(rt005Interface.field).assertEqual('updated')
    })

    /**
     * @tc.number SUB_STATIC_SPEC_TYPESAFEFIELDINHERITANCERT_0600
     * @tc.name TypeSafeFieldInheritanceRt006
     * @tc.desc test grandchild overrides root field, consistent read through root reference skipping middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeSafeFieldInheritanceRt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rt006Leaf: FieldInheritRt006Leaf = new FieldInheritRt006Leaf()
      let rt006Root: FieldInheritRt006Root = rt006Leaf
      expect(rt006Leaf.field).assertEqual('leaf')
      expect(rt006Root.field).assertEqual('leaf')
    })
  })
}
