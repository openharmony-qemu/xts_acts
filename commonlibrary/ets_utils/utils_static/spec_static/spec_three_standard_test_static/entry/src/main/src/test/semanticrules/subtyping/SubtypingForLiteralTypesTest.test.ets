'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

type strLiteral1 = "some_string"
let a1: strLiteral1 = "some_string"
let b1: String = "another_string"

type UnionWide2 = String | String
type UnionNarrow2 = "some_string" | "some_other_string"
function foo2(): UnionNarrow2 {
  return "some_other_string"
}

class A3 {
  a: 'a'|'b' = 'a'
  foo(v: 'a'|'b'): 'a'|'b' {
    return this.a;
  }
}
class B3 extends A3 {
  b: 'b' = 'b'
  override foo(v: string): 'b' {
    return this.b
  }
}

let foo4: (v: string) => 'a'|'b' = (v: string): 'a'|'b' => {return 'a'}
let foo2_4: (v: 'b') => 'a'|'b'|'c' = (v: 'b'): 'a'|'b'|'c' => {return 'b'};

let x5: null = null
let y5: null = null


type StringUnion7 = 'some_string' | 'some_other_string'
type StrLiteral7 = 'some_string'
function foo7(a: StrLiteral7, b: StringUnion7) {
  b = a
  expect(b instanceof String).assertTrue()
  return true
}

export default function SubtypingForLiteralTypesTest(): void {
  describe('SubtypingForLiteralTypesTest', () => {
    beforeAll(() => {
    })
    
    beforeEach(() => {
    })
    
    afterEach(() => {
    })
    
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0100
     * @tc.name      testLiteralType0001
     * @tc.desc      Subtype relation between type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLiteralType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      b1 = a1
      expect(b1 instanceof strLiteral1).assertTrue()

    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0200
     * @tc.name      testLiteralType0002
     * @tc.desc      Subtype relation between type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLiteralType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: UnionNarrow2 = foo2()
      let b: UnionWide2 = a
      expect(b).assertEqual("some_other_string")
      let c: String = b
      expect(c instanceof String).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0300
     * @tc.name      testSubtypingLiterals0003
     * @tc.desc      Subtype relation among type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingLiterals0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: A3 = new A3();
      let b: A3 = new B3();
      expect(a.foo('a')).assertEqual('a')
      expect(b.foo('b')).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0400
     * @tc.name      testSubtypingLiterals0004
     * @tc.desc      Subtype relation among type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingLiterals0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let bar = foo2_4
      expect(bar('b')).assertEqual('b')
      bar = foo4;
      expect(bar('b')).assertEqual('a')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0500
     * @tc.name      testSubtypingLiterals0005
     * @tc.desc      Subtype relation among type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingLiterals0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      x5 = y5
      x5 = null
      y5 = x5

      expect(y5).assertNull()
      expect(x5).assertNull()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_LITERAL_TYPES_0600
     * @tc.name      testSubtypingLiterals0006
     * @tc.desc      Subtype relation among type literal and type String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingLiterals0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(foo7('some_string', 'some_string')).assertTrue()

    });
  })
}