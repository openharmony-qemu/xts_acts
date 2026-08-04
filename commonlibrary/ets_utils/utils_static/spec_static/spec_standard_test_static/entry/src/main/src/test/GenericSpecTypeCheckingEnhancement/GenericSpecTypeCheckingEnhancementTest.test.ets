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
} from "../../../../hypium/index";

function foo<T>(p: T, q: T): T {
  return p ?? q
}

const func: (p: Object) => Object = e => e;
function foo_3<T>(p: (p: T) => T) { return 1 }

interface ConvertibleTo<T> {
  convert(): T;
}

interface TwoWayConvertible<T extends ConvertibleTo<S>, S extends ConvertibleTo<T>> {
  t2s(s: S): T;
  s2t(t: T): S;
}

class Incremented implements ConvertibleTo<Decremented> {
  i: number;
  constructor(i: number) {
    this.i = ++i
  }
  convert(): Decremented {
    return new Decremented(this.i - 1);
  }
}

class Decremented implements ConvertibleTo<Incremented> {
  i: number;
  constructor(i: number) {
    this.i = i - 1;
  }
  convert(): Incremented {
    return new Incremented(this.i + 1);
  }
}

class Intf5901 implements TwoWayConvertible<Incremented, Decremented> {
  public t2s(d: Decremented): Incremented {
    return d.convert();
  }
  public s2t(i: Incremented): Decremented {
    return i.convert();
  }
}

class Base {}
class Derived extends Base {}

class Holder04<T extends Base> {
  value : T

  constructor(value: T) {
    this.value = value
  }

  bar<U = T>(): U {
    return this.value as U
  }
}

class Holder05<T extends Base> {
  keep<U extends T>(x: U): U {
    return x
  }
}

export default function GenericSpecTypeCheckingEnhancement(): void {
  describe('GenericSpecTypeCheckingEnhancement', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_GENERICSPECTYPECHECKINGENHANCEMENT_0100
     * @tc.name GenericSpecTypeCheckingEnhancementTest001
     * @tc.desc Generic type parameter inference with different argument types resolving to common supertype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('GenericSpecTypeCheckingEnhancementTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new Object();
      let b = "abc";
      expect(typeof foo(a, b)).assertEqual('object');
    })

   /**
    * @tc.number SUB_STATIC_SPEC_GENERICSPECTYPECHECKINGENHANCEMENT_0200
    * @tc.name GenericSpecTypeCheckingEnhancementTest002
    * @tc.desc Two-way generic interface conversion between mutually convertible types
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level LEVEL1
    */
    it('GenericSpecTypeCheckingEnhancementTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ref = new Intf5901();
      let val1 = new Decremented(1);
      let val2 = new Incremented(1);
      expect(ref.t2s(val1).i).assertEqual(2);
      expect(ref.s2t(val2).i).assertEqual(0);
    })

   /**
    * @tc.number SUB_STATIC_SPEC_GENERICSPECTYPECHECKINGENHANCEMENT_0300
    * @tc.name GenericSpecTypeCheckingEnhancementTest003
    * @tc.desc Generic function parameterized with Object type and identity arrow function argument
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level LEVEL1
    */
    it('GenericSpecTypeCheckingEnhancementTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ref = foo_3<Object>(e => e)
      expect(ref).assertEqual(1);
    })

   /**
    * @tc.number SUB_STATIC_SPEC_GENERICSPECTYPECHECKINGENHANCEMENT_0400
    * @tc.name GenericSpecTypeCheckingEnhancementTest004
    * @tc.desc After a generic type is instantiated with a concrete type, its generic method internally calls another generic method.
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level LEVEL1
    */
    it('GenericSpecTypeCheckingEnhancementTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let h: Holder04<Derived> = new Holder04<Derived>(new Derived());
      let x: Derived = h.bar();
      expect(x instanceof Derived).assertTrue();
    })

   /**
    * @tc.number SUB_STATIC_SPEC_GENERICSPECTYPECHECKINGENHANCEMENT_0500
    * @tc.name GenericSpecTypeCheckingEnhancementTest005
    * @tc.desc After a generic type is instantiated with a concrete type, its generic method internally calls another generic method.
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level LEVEL1
    */
    it('GenericSpecTypeCheckingEnhancementTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let h: Holder05<Derived> = new Holder05<Derived>();
      let x: Derived = h.keep<Derived>(new Derived());
      expect(x instanceof Derived).assertTrue();
    })
  })
}
