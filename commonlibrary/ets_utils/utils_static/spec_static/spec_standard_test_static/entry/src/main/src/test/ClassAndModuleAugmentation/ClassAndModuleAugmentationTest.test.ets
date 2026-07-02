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
} from "../../../../hypium";

let res = 0;

function foo() {
  return ++res
}

class A {
  fld: int = foo()

  constructor(a: boolean) { }

  constructor() {
    this(true)
  }
}

class Base { }
class Derived extends Base { }

interface II1 {
  foo(p: Base) { return 1 }
}

interface II2 {
  foo(p: Derived) { return 2 }
}

interface II3 extends II1, II2 { }

enum Color { Red, Green, Blue }

interface RoArray<T> {
  val(i: int): T
  len(): int
}

class XIterator<T> implements Iterator<T> {
  index: int = 0
  data: RoArray<T>
  constructor(p: RoArray<T>) {
    this.data = p
  }
  override next(): IteratorResult<T> {
    return new IteratorResult<T>(this.index >= this.data.len(),
      this.index >= this.data.len() ? undefined : this.data.val(this.index++));
  }
}

abstract class D implements RoArray<string> {
  $_iterator() {
    return new XIterator<string>(this)
  }
  abstract val(i: int): string
  abstract len(): int
}

abstract class E extends D {
}

abstract class F extends E {
}

class C extends F {
  arr: string[] = ['a', 'b', 'c']
  override val(i: int): string {
    return this.arr[i]
  }
  override len(): int {
    return this.arr.length
  }
}

export default function ClassAndModuleAugmentationTest(): void {
  describe('ClassAndModuleAugmentationTest', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSANDMODULEAUGMENTATION_0100
     * @tc.name ClassAndModuleAugmentationTest001
     * @tc.desc Delegating constructor and field initializer execution order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassAndModuleAugmentationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      res = 0;
      let a = new A();
      expect(a.fld).assertEqual(1);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSANDMODULEAUGMENTATION_0200
     * @tc.name ClassAndModuleAugmentationTest002
     * @tc.desc Interface multiple inheritance with compatible method signatures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassAndModuleAugmentationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let meth: II3 = {
        foo(p: Derived) { }
      }
      expect(meth.foo(new Derived())).assertEqual(1);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSANDMODULEAUGMENTATION_0300
     * @tc.name ClassAndModuleAugmentationTest003
     * @tc.desc Char array creation with enum value as size specifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassAndModuleAugmentationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let v: char[] = new char[Color.Green](c'@');
      expect(v.length).assertEqual(1);
      expect(v[0]).assertEqual(c'@');
    })

    /**
     * @tc.number SUB_STATIC_SPEC_CLASSANDMODULEAUGMENTATION_0400
     * @tc.name ClassAndModuleAugmentationTest004
     * @tc.desc Iteration over a class implementing RoArray interface with custom Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassAndModuleAugmentationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let c = new C()

      let res = ''
      for (let x of c) {
        res += x
      }
      expect(res).assertEqual('abc');
    })
  })
}
