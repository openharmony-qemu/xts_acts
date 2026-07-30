'use static';
/*
---
Copyright (c) 2025-2026 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
---
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace MyNamespace0 {
  export class NsClass {
    private static text: string = "defaultText"
    constructor() {
      NsClass.text = "foo from myClass"
    }
    static foo(): string {
      return NsClass.text
    }
  }
}

namespace MyNamespace1 {
  export interface NsInterface {
    name: string
    age: number
  }
}

namespace MyNamespace2 {
  export enum NsEnum { White, Blue = 2, Red = 2 }
  export enum NsSeason { Winter = "Зима", Spring = "Primavera", Summer = "夏天", Autumn = "秋天" }
}

namespace MyNamespace3 {
  export type Vector = number[]
  export function max(x: Vector): number {
    let m = x[0]
    for (let v of x)
    if (v > m) m = v
    return m
  }
}

namespace MyNamespace4 {
  export let nsVariable: number = 13
  export const nsConstValue: number = 42
}

namespace MyNamespace5 {
  export const nsConstValue5: number = 42
}

namespace MyNamespace6 {
  export const nsConstValue6: number = 53
  export function returnConst(): number {
    return MyNamespace6.nsConstValue6
  }
}

namespace MyNamespace7 {
  export function foo(): string {
    return "foo"
  }
}

namespace MyNamespace8 {
  export namespace EmbeddedNamespace {
    export function foo(): string {
      return "embeddedFoo"
     }
  }
}

namespace NameSpaceA {
  export function foo(): string {
    return "quialifiedFoo"
  }
}

namespace NameSpaceB {
  export function foo(): string {
    return "SingleFoo"
  }
}
namespace NameSpaceB {
  export function bar(): string {
    return "SingleBar"
  }
}

namespace NameSpaceC {
  export function foo(): string {
    return "Foo1"
  }
}
namespace NameSpaceC.D {
  export function foo(): string {
    return "Foo2"
  }
}
namespace NameSpaceC.D.E {
  export function foo(): string {
    return "Foo3"
  }
}

namespace NameSpaceD {
  export let variable1: number = 1

  export namespace C {
    export let variable11: number = 11
  }
}

namespace NameSpaceD.C {
  export let variable12: number = 12
}

namespace NameSpaceE {
  export let variable: number = 1234
}

class MyClass13 {
  public variable: number = 4321
}

namespace NameSpaceF {
  export function foo1(): string {
    return "FOO15"
  }
}
namespace NameSpacef {
  export function foo1(): string {
    return "foo15_low"
  }
}

namespace NameSpaceG {
  function foo1(): string {
    return "Foo16"
  }
  export function foo2(): string {
    return foo1()
  }
}

namespace NameSpaceH {
  export function foo(): string {
    return "Foo17"
  }
  export function boo(): string {
    return foo()
  }
}

namespace NameSpaceI {
  function foo(): string {
    return "Foo18"
  }
  export function boo(): string {
    return foo()
  }
}

namespace NameSpaceJ {
  export function foo(): string {
    return "Foo19"
  }
  export function boo(): string {
    return NameSpaceJ.foo()
  }
}

export namespace Space1 {
  export function foo(): string {
    return "Local Space1"
  }
  export let nsVar: number = 1234
  export const nsConst: number = 2345
}

let NsStaticInitD: number = 0
namespace NsStaticInit0 {
  export let i: number = 0
  export let d: number = 0
  static {
    i = 2
  }
}

namespace NsStaticInit1 {
  let i: number = 0
  export function foo(): number {
    return i
  }
  static {
    i = 2
  }
}

namespace NsStaticInit2A {
  export let i: Object = new Object()
  export function foo(): Object { return new Object() }
  static {
    i = NsStaticInit2B.foo()
  }
}
namespace NsStaticInit2B {
  export let i: Object = new Object()
  export function foo(): Object { return new Object() }
  static {
    i = NsStaticInit2A.foo()
  }
}

namespace NsStaticInit3A {
  export let i: Object = new Object()
  export function foo(): Object { return i }
  static {
    NsStaticInit3B.foo()
    i = new Object()
  }
}
namespace NsStaticInit3B {
  export let i: Object = new Object()
  export function foo(): Object { return i }
  static {
    NsStaticInit3A.foo()
    i = new Object()
  }
}

namespace NsMergeA {
  export function foo(): number { return 1 }
  export function bar(): number { return 2 }
  export function goo(): number { return (bar()+1) }
}

namespace NsMergeB {
  export namespace Inner {
    export let i: number = 7
  }
}
namespace NsMergeB.Inner {
  export function foo(): number {
    return NsMergeB.Inner.i
  }
}

namespace NsSingleStaticA {
  export let a: number = 0
  static {
    a += 1
  }
  export namespace B {
    export let b: number = 0
    static {
      b += 2
    }
  }
}
namespace NsSingleStaticA.B.C {
  export let c: number = 0
  export function foo(): number {
    return NsSingleStaticA.B.C.c
  }
  static {
    c += 3
  }
}

let NsTopInitAccessCounter: number = 0
let NsTopInitInit: boolean = false

namespace NsTopInitUsed {
    export let someUsedVar: string = ""
    NsTopInitAccessCounter += 1
}

namespace NsTopInitUnused {
    export let someUnUsedVar: string = ""
    NsTopInitAccessCounter += 1
}

let NsTopInit1AccessCounter: number = 0
let NsTopInit1AccessCounter1: number = 0
let NsTopInit1Init: boolean = false

namespace NsTopInit1Used {
    export let someUsedVar: string = ""
    NsTopInit1AccessCounter += 1

    export namespace NSNested {
        NsTopInit1AccessCounter1 += 1
        export let someUsedNestedVar: string = ""
    }
}

namespace NsTopInit1Unused {
    export let someUnUsedVar: string = ""
    NsTopInit1AccessCounter += 1
}

let NsTopInit2AccessCounter: number = 0
let NsTopInit2Init: boolean = false

namespace NsTopInit2UsedAndMerged {
    export let someUsedVar: string = ""
    NsTopInit2AccessCounter += 1
}

namespace NsTopInit2UsedAndMerged {
    NsTopInit2AccessCounter += 1
}

namespace NsSimpleSpecA {
    export function foo(): string {return "A foo"}
    function bar(): string {return "A bar"}

    export namespace C {
        export function too(): string {return "A too"}
    }
}

namespace NsSimpleSpecA {
    export function goo(): string {
        expect(NsSimpleSpecA.foo()).assertEqual("A foo")
        expect(foo()).assertEqual("A foo")
        expect(NsSimpleSpecA.C.moo()).assertEqual("A too")
        return bar()
    }
}

namespace NsSimpleSpecA.C {
    export function moo(): string {
        expect(too()).assertEqual("A too")
        return NsSimpleSpecA.C.too()
    }
}

namespace NsSimpleSpecB { }

namespace NsSimpleSpec2A {
    let variable1: number = 1;
    export namespace C {
        export let variable11: number = 11;
    }
}

namespace NsSimpleSpec2A {
    let variable2: number = 2;
}

namespace NsSimpleSpec2A.C {
    export let variable12: number = 12;
}

export default function NameSpaceDeclarationsTest(): void {
  describe('NameSpaceDeclarationsTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0100
     * @tc.name      testNamespaceDeclarations0001
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for access
     *               to each exported entity of a namespace. Tests basic top-level declarations with class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace0.NsClass.foo()).assertEqual("defaultText");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0200
     * @tc.name      testNamespaceDeclarations0002
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for access
     *               to each exported entity of a namespace. Tests basic top-level declarations with interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myIfce: MyNamespace1.NsInterface = {name: "ABC", age: 123};
      expect(myIfce.name).assertEqual("ABC");
      expect(myIfce.age).assertEqual(123);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0300
     * @tc.name      testNamespaceDeclarations0003
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests basic top-level declarations with enum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace2.NsEnum.Red.valueOf()).assertEqual(2);
      expect(MyNamespace2.NsSeason.Spring.valueOf()).assertEqual("Primavera");
      expect(MyNamespace2.NsSeason.Summer.valueOf()).assertEqual("夏天");
      expect(MyNamespace2.NsSeason.Autumn.valueOf()).assertEqual("秋天");
      expect(MyNamespace2.NsSeason.Winter.valueOf()).assertEqual("Зима");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0400
     * @tc.name      testNamespaceDeclarations0004
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for access
     *               to each exported entity of a namespace. Tests basic top-level declarations with type and function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: MyNamespace3.Vector = [3, 2, 1];
      expect(MyNamespace3.max(x)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0500
     * @tc.name      testNamespaceDeclarations0005
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace.
     *               Tests basic top-level declarations with variable and constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = MyNamespace4.nsVariable != 41;
      expect(result).assertTrue();
      MyNamespace4.nsVariable = 43;
      expect(MyNamespace4.nsVariable).assertEqual(43);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0600
     * @tc.name      testNamespaceDeclarations0006
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for
     *               access to each exported entity of a namespace. Tests basic top-level declarations with constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace5.nsConstValue5).assertEqual(42);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0700
     * @tc.name      testNamespaceDeclarations0007
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests function returning constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace6.returnConst()).assertEqual(53);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0800
     * @tc.name      testNamespaceDeclarations0008
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests simple function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace7.foo()).assertEqual("foo");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_0900
     * @tc.name      testNamespaceDeclarations0009
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests embedded namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MyNamespace8.EmbeddedNamespace.foo()).assertEqual("embeddedFoo");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1000
     * @tc.name      testNamespaceDeclarations0010
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests qualified namespace name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceA.foo()).assertEqual("quialifiedFoo");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1100
     * @tc.name      testNamespaceDeclarations0011
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests merged namespaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceB.foo()).assertEqual("SingleFoo");
      expect(NameSpaceB.bar()).assertEqual("SingleBar");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1200
     * @tc.name      testNamespaceDeclarations0012
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests nested qualified namespaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceC.foo()).assertEqual("Foo1");
      expect(NameSpaceC.D.foo()).assertEqual("Foo2");
      expect(NameSpaceC.D.E.foo()).assertEqual("Foo3");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1300
     * @tc.name      testNamespaceDeclarations0013
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *              for access to each exported entity of a namespace. Tests merged nested namespaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceD.variable1).assertEqual(1);
      expect(NameSpaceD.C.variable11).assertEqual(11);
      expect(NameSpaceD.C.variable12).assertEqual(12);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1400
     * @tc.name      testNamespaceDeclarations0014
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests namespace shadowing by class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nsInstance: MyClass13 = new MyClass13();
      expect(nsInstance.variable).assertEqual(4321);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1500
     * @tc.name      testNamespaceDeclarations0015
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests case sensitivity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpacef.foo1()).assertEqual("foo15_low");
      expect(NameSpaceF.foo1()).assertEqual("FOO15");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1600
     * @tc.name      testNamespaceDeclarations0016
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for
     *               access to each exported entity of a namespace. Tests local variable can shadow imported namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let NameSpaceE: string = "Test should pass";
      expect(NameSpaceE).assertEqual("Test should pass");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1700
     * @tc.name      testNamespaceDeclarations0017
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests non-exported function access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceG.foo2()).assertEqual("Foo16");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1800
     * @tc.name      testNamespaceDeclarations0018
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for access
     *               to each exported entity of a namespace. Tests exported function calling another exported function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceH.boo()).assertEqual("Foo17");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_1900
     * @tc.name      testNamespaceDeclarations0019
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier for access
     *               to each exported entity of a namespace. Tests exported function calling non-exported function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceI.boo()).assertEqual("Foo18");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2000
     * @tc.name      testNamespaceDeclarations0020
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *               for access to each exported entity of a namespace. Tests exported function calling exported
     *                function with namespace prefix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NameSpaceJ.boo()).assertEqual("Foo19");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2100
     * @tc.name      testNamespaceDeclarations0021
     * @tc.desc      A namespace declaration introduces the qualified name to be used as a qualifier
     *                for access to each exported entity of a namespace. Tests local exported namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Space1.foo()).assertEqual("Local Space1");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2200
     * @tc.name      testNamespaceDeclarations0022
     * @tc.desc      The code in static block is executed only when the namespace members are used in the program.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      NsStaticInitD = 7;
      expect(NsStaticInit0.d).assertEqual(0);
      expect(NsStaticInit0.i).assertEqual(2);
      expect(NsStaticInitD).assertEqual(7);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2300
     * @tc.name      testNamespaceDeclarations0023
     * @tc.desc      The code in static block is executed only when the namespace members are used in the program.
     *               Initialize not exported field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsStaticInit1.foo()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2400
     * @tc.name      testNamespaceDeclarations0024
     * @tc.desc      The code in static block is executed only when the namespace members are used in the program.
     *               Initialize by calling from another namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsStaticInit2A.i !== null).assertTrue();
      expect(NsStaticInit2B.i !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2500
     * @tc.name      testNamespaceDeclarations0025
     * @tc.desc      The code in static block is executed only when the namespace members are used in the program.
     *               Let static initializer use variable before it was initialized.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsStaticInit3A.foo() !== null).assertTrue();
      expect(NsStaticInit3B.foo() !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2600
     * @tc.name      testNamespaceDeclarations0026
     * @tc.desc      Only one of the merging namespaces can have an initializer. Otherwise, a compile-time error occurs.
     *               Exported function is accessible in the same namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsMergeA.foo()).assertEqual(1);
      expect(NsMergeA.bar()).assertEqual(2);
      expect(NsMergeA.goo()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2700
     * @tc.name      testNamespaceDeclarations0027
     * @tc.desc      Only one of the merging namespaces can have an initializer. Otherwise, a compile-time error occurs.
     *               Qualified namespace name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsMergeB.Inner.foo()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2800
     * @tc.name      testNamespaceDeclarations0028
     * @tc.desc      Only one of the merging namespaces can have an initializer. Otherwise, a compile-time error occurs.
     *               Qualified namespace name used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsSingleStaticA.B.b).assertEqual(2);
      expect(NsSingleStaticA.B.C.foo()).assertEqual(3);
      expect(NsSingleStaticA.a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_2900
     * @tc.name      testNamespaceDeclarations0029
     * @tc.desc      Namespaces like modules can have top-level statements which act as namespace initializers,
     *               and are called only if at least one of the exported namespace members is used in the program.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if(!NsTopInitInit) {
        NsTopInitInit = true;
        NsTopInitUsed.someUsedVar = "Accessed 1";
        expect(1).assertEqual(NsTopInitAccessCounter);
        NsTopInitUsed.someUsedVar = "Accessed 2";
        expect(1).assertEqual(NsTopInitAccessCounter);
      }
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_3000
     * @tc.name      testNamespaceDeclarations0030
     * @tc.desc      Namespaces like modules can have top-level statements which act as namespace initializers,
     *               and are called only if at least one of the exported namespace members is used in the program.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if(!NsTopInit1Init) {
        NsTopInit1Init = true;
        NsTopInit1Used.NSNested.someUsedNestedVar = "Accessed";
        expect(0).assertEqual(NsTopInit1AccessCounter);
        expect(1).assertEqual(NsTopInit1AccessCounter1);

        NsTopInit1Used.someUsedVar = "Accessed 2";
        NsTopInit1Used.NSNested.someUsedNestedVar = "Accessed 2";
        expect(1).assertEqual(NsTopInit1AccessCounter);
        expect(1).assertEqual(NsTopInit1AccessCounter1);
      }
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_3100
     * @tc.name      testNamespaceDeclarations0031
     * @tc.desc      Namespaces like modules can have top-level statements which act as namespace initializers,
     *                and are called only if at least one of the exported namespace members is used in the program.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if(!NsTopInit2Init) {
        NsTopInit2Init = true;
        NsTopInit2UsedAndMerged.someUsedVar = "Accessed";
        expect(2).assertEqual(NsTopInit2AccessCounter);
      }
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_3200
     * @tc.name      testNamespaceDeclarations0032
     * @tc.desc      Sample from spec, Namespaces with identical namespace names in a single compilation unit
     *                merge their exported declarations into a single namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsSimpleSpecA.goo()).assertEqual("A bar");
    });

    /**
     * @tc.number    SUB_NAMESPACE_ONE_DECLARATIONS_3300
     * @tc.name      testNamespaceDeclarations0033
     * @tc.desc      Sample from spec, Namespaces with identical namespace names in a single compilation
     *                unit merge their exported declarations into a single namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceDeclarations0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NsSimpleSpec2A.C.variable11).assertEqual(11);
      expect(NsSimpleSpec2A.C.variable12).assertEqual(12);
    });

  })
}