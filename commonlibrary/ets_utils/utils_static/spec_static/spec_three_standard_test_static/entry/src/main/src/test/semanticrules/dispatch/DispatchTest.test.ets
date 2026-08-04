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
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../../hypium/index';
import Utils from '../../Util.test'

// ==================== Dispatch Tests ====================

interface IDispatch1 {
  fld1: string
  fld2: number
}
class ADispatch1 implements IDispatch1 {
  fld1: string = "abc"
  fld2: number = 1
}
class BDispatch1 implements IDispatch1 {
  fld1: string = "def"
  fld2: number = 2
}

class ADispatch2<T> {
  foo(): ADispatch2<T> { return this }
}
class BDispatch2 {}

interface IDispatch3 {
  fld1: string
  fld2: number
}

interface IDispatch4 {
  fld1: string
}
class ADispatch4 {
  fld1: string = "abc"
}
class BDispatch4 {
  fld1: number = 1
}

// ==================== Dynamic Dispatch Tests ====================

class ADynDispatch1 {
  met(): string {return "A"}
}
class BDynDispatch1 extends ADynDispatch1 {
  override met(): string {return "B"}
}

namespace FirstNs {
  export class ADynDispatch2 {
    met(): string {return "A"}
  }
  export class BDynDispatch2 extends ADynDispatch2 {
    override met(): string {return "B"}
  }
}
namespace SecondNs {
  export class CDynDispatch2 extends FirstNs.ADynDispatch2 {
    override met(): string {return "C"}
  }
}

class ADynDispatch3 {
  met(): string {return "A"}
}
class BDynDispatch3 extends ADynDispatch3 {
  override met(): string {return "B"}
}
class CDynDispatch3 extends BDynDispatch3 {
  override met(): string {return "C"}
}

// Union type dynamic dispatch - classes share same interface
interface IUnionDyn {
  met(): string
}
class AUnionDyn implements IUnionDyn {
  met(): string {return "A"}
}
class BUnionDyn implements IUnionDyn {
  met(): string {return "B"}
}

class ADynDispatch5 {
  met(): string {return "A"}
}
class BDynDispatch5 extends ADynDispatch5 {
  override met(): string {return "B"}
}

interface IDynDispatch6 {
  met(): number
}
class ADynDispatch6 implements IDynDispatch6 {
  met(): number {return 1};
}
class BDynDispatch6 implements IDynDispatch6 {
  met(): number {return 2};
}

namespace FirstNs7 {
  export interface IDynDispatch7 {
    met(): number
  }
  export class ADynDispatch7 implements IDynDispatch7 {
    met(): number {return 1};
  }
}
namespace SecondNs7 {
  export class BDynDispatch7 implements FirstNs7.IDynDispatch7 {
    met(): number {return 2};
  }
}

interface ADynDispatch8 {
  foo(x: number): void
}
interface BDynDispatch8 {
  foo(x: string): void
}
class CDynDispatch8 implements ADynDispatch8, BDynDispatch8 {
  foo(x: number | string): void {}
}

// ==================== Static Dispatch Tests ====================

class AStaticDispatch1 {
  fld: number = 1
}
class BStaticDispatch1 extends AStaticDispatch1 {
  fld: number = 2
}

namespace FirstNsStatic2 {
  export class AStaticDispatch2 {
    fld: number = 1
  }
  export class BStaticDispatch2 extends AStaticDispatch2 {
    fld: number = 2
  }
}
namespace SecondNsStatic2 {
  export class CStaticDispatch2 extends FirstNsStatic2.AStaticDispatch2 {
    fld: number = 3
  }
}

// Union type static dispatch - classes share same interface
interface IUnionStatic {
  fld: string
}
class AUnionStatic implements IUnionStatic {
  fld: string = "A"
}
class BUnionStatic implements IUnionStatic {
  fld: string = "B"
}

interface IStaticDispatch4 {
  fld: string
}
class AStaticDispatch4 implements IStaticDispatch4 {
  fld: string = "abc";
}
class BStaticDispatch4 implements IStaticDispatch4 {
  fld: string = "def";
}

namespace FirstNsStatic5 {
  export interface IStaticDispatch5 {
    fld: string
  }
  export class AStaticDispatch5 implements IStaticDispatch5 {
    fld: string = "abc";
  }
}
namespace SecondNsStatic5 {
  export class BStaticDispatch5 implements FirstNsStatic5.IStaticDispatch5 {
    fld: string = "def";
  }
}

interface I1StaticDispatch6 {
  fld1: string
}
interface I2StaticDispatch6 extends I1StaticDispatch6 {
  fld2: string
}
class AStaticDispatch6 implements I2StaticDispatch6 {
  fld1: string = "a1"
  fld2: string = "a2"
}
class BStaticDispatch6 extends AStaticDispatch6 implements I1StaticDispatch6 {
  fld1: string = "b1"
  fld2: string = "b2"
}

interface I1StaticDispatch7 {
  fld: string
}
interface I2StaticDispatch7 {
  fld: string
}
class AStaticDispatch7 implements I1StaticDispatch7, I2StaticDispatch7 {
  fld: string = "3"
}
class BStaticDispatch7 implements I1StaticDispatch7, I2StaticDispatch7 {
  fld: string = "4"
}

// ==================== Root Call Dispatch Tests ====================

class ARootDispatch1 {
  fld: number = 1
  met(): string {return "A"}
}
class BRootDispatch1 extends ARootDispatch1 {
  fld: number = 2
  override met(): string {return "B"}
}

interface IRootDispatch2 {
  fld: string
  met(): number
}
class ARootDispatch2 implements IRootDispatch2 {
  fld: string = "abc";
  met(): number {return 1};
}
class BRootDispatch2 implements IRootDispatch2 {
  fld: string = "def";
  met(): number {return 2};
}

interface ARootDispatch3 {
  foo(x: number): void
}
interface BRootDispatch3 {
  foo(x: string): void
}
class CRootDispatch3 implements ARootDispatch3, BRootDispatch3 {
  foo(x: number | string): void {}
}

export default function DispatchTest():void {
  describe('DispatchTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // ==================== Dispatch Tests ====================

    /**
     * @tc.number    SUB_DISPATCH_ONE_TEST_0100
     * @tc.name      testDispatch0001
     * @tc.desc      Field access with interface implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDispatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ADispatch1 = new ADispatch1()
      let b: BDispatch1 = new BDispatch1()
      expect(a.fld1).assertEqual("abc");
      expect(a.fld2).assertEqual(1);
      expect(b.fld1).assertEqual("def");
      expect(b.fld2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_DISPATCH_ONE_TEST_0200
     * @tc.name      testDispatch0002
     * @tc.desc      Generic class method dispatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDispatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ADispatch2<BDispatch2> = new ADispatch2<BDispatch2>()
      let b = a.foo().foo()
      expect(a instanceof ADispatch2).assertTrue();
    });

    /**
     * @tc.number    SUB_DISPATCH_ONE_TEST_0300
     * @tc.name      testDispatch0003
     * @tc.desc      Interface with object literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDispatch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: IDispatch3 | null = {fld1: 'dfgd', fld2: 5}
      expect(i!.fld1).assertEqual('dfgd');
      expect(i!.fld2).assertEqual(5);
    });

    /**
     * @tc.number    SUB_DISPATCH_ONE_TEST_0400
     * @tc.name      testDispatch0004
     * @tc.desc      Union type field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDispatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ADispatch4 | BDispatch4 = new ADispatch4()
      expect(a.fld1).assertEqual("abc");
      let b: ADispatch4 | BDispatch4 = new BDispatch4()
      expect(b.fld1).assertEqual(1);
    });

    // ==================== Dynamic Dispatch Tests ====================

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_0500
     * @tc.name      testDynamicDispatch0005
     * @tc.desc      Dynamic dispatch with class inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ADynDispatch1[] = [new ADynDispatch1(), new BDynDispatch1()];
      let arr2 = arr.map((x: ADynDispatch1) => x.met())
      expect(arr2.join(" ")).assertEqual("A B");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_0600
     * @tc.name      testDynamicDispatch0006
     * @tc.desc      Dynamic dispatch with namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FirstNs.ADynDispatch2[] = [new FirstNs.ADynDispatch2(), new FirstNs.BDynDispatch2(), new SecondNs.CDynDispatch2()];
      let arr2 = arr.map((x: FirstNs.ADynDispatch2) => x.met())
      expect(arr2.join(" ")).assertEqual("A B C");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_0700
     * @tc.name      testDynamicDispatch0007
     * @tc.desc      Dynamic dispatch with multiple overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ADynDispatch3[] = [new ADynDispatch3(), new BDynDispatch3(), new CDynDispatch3()];
      let arr2 = arr.map((x: ADynDispatch3) => x.met())
      expect(arr2.join(" ")).assertEqual("A B C");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_0800
     * @tc.name      testDynamicDispatch0008
     * @tc.desc      Dynamic dispatch with union type call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: IUnionDyn[] = [new AUnionDyn(), new BUnionDyn()];
      let arr2 = arr.map((x: IUnionDyn) => x.met())
      expect(arr2.join(" ")).assertEqual("A B");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_0900
     * @tc.name      testDynamicDispatch0009
     * @tc.desc      Dynamic dispatch preserved in cast
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ADynDispatch5 = new BDynDispatch5();
      let b: BDynDispatch5 = a as BDynDispatch5;
      expect(b.met()).assertEqual("B");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1000
     * @tc.name      testDynamicDispatch0010
     * @tc.desc      Dynamic dispatch with interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IDynDispatch6 = new ADynDispatch6()
      let b: IDynDispatch6 = new BDynDispatch6()
      expect(a.met()).assertEqual(1);
      expect(b.met()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1100
     * @tc.name      testDynamicDispatch0011
     * @tc.desc      Dynamic dispatch with interface and namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDynamicDispatch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FirstNs7.IDynDispatch7 = new FirstNs7.ADynDispatch7()
      let b: FirstNs7.IDynDispatch7 = new SecondNs7.BDynDispatch7()
      expect(a.met()).assertEqual(1);
      expect(b.met()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1300
     * @tc.name      testStaticDispatch0013
     * @tc.desc      Static dispatch with field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: AStaticDispatch1 = new BStaticDispatch1();
      expect(a.fld).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1400
     * @tc.name      testStaticDispatch0014
     * @tc.desc      Static dispatch with namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FirstNsStatic2.AStaticDispatch2[] = [new FirstNsStatic2.AStaticDispatch2(), new FirstNsStatic2.BStaticDispatch2(), new SecondNsStatic2.CStaticDispatch2()];
      let arr3 = arr.map((x: FirstNsStatic2.AStaticDispatch2) => x.fld.toString())
      expect(arr3.join(" ")).assertEqual("1 2 3");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1500
     * @tc.name      testStaticDispatch0015
     * @tc.desc      Static dispatch with union type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: IUnionStatic[] = [new AUnionStatic(), new BUnionStatic()];
      let arr2 = arr.map((x: IUnionStatic) => x.fld)
      expect(arr2.join(" ")).assertEqual("A B");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1600
     * @tc.name      testStaticDispatch0016
     * @tc.desc      Static dispatch with interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IStaticDispatch4 = new AStaticDispatch4()
      let b: IStaticDispatch4 = new BStaticDispatch4()
      expect(a.fld).assertEqual("abc");
      expect(b.fld).assertEqual("def");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1700
     * @tc.name      testStaticDispatch0017
     * @tc.desc      Static dispatch with interface and namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FirstNsStatic5.IStaticDispatch5 = new FirstNsStatic5.AStaticDispatch5()
      let b: FirstNsStatic5.IStaticDispatch5 = new SecondNsStatic5.BStaticDispatch5()
      expect(a.fld).assertEqual("abc");
      expect(b.fld).assertEqual("def");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1800
     * @tc.name      testStaticDispatch0018
     * @tc.desc      Static dispatch with interface extension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: AStaticDispatch6 = new AStaticDispatch6()
      let b: AStaticDispatch6 = new BStaticDispatch6()
      expect(a.fld1).assertEqual("a1");
      expect(a.fld2).assertEqual("a2");
      expect(b.fld1).assertEqual("b1");
      expect(b.fld2).assertEqual("b2");
    });

    /**
     * @tc.number    SUB_STATIC_DISPATCH_TEST_1900
     * @tc.name      testStaticDispatch0019
     * @tc.desc      Static dispatch with several interfaces implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticDispatch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: I1StaticDispatch7 = new AStaticDispatch7()
      let a2: I2StaticDispatch7 = new AStaticDispatch7()
      let b1: I1StaticDispatch7 = new BStaticDispatch7()
      let b2: I2StaticDispatch7 = new BStaticDispatch7()

      expect(a1.fld).assertEqual("3");
      expect(a2.fld).assertEqual("3");
      expect(b1.fld).assertEqual("4");
      expect(b2.fld).assertEqual("4");
    });

    // ==================== Root Call Dispatch Tests ====================

    /**
     * @tc.number    SUB_ROOT_CALL_DISPATCH_2000
     * @tc.name      testRootCallDispatch0020
     * @tc.desc      Static and dynamic dispatch root call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRootCallDispatch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ARootDispatch1 = new BRootDispatch1();
      expect(a.fld).assertEqual(2); // static dispatch
      expect(a.met()).assertEqual("B"); // dynamic dispatch
    });

    /**
     * @tc.number    SUB_ROOT_CALL_DISPATCH_2100
     * @tc.name      testRootCallDispatch0021
     * @tc.desc      Static and dynamic dispatch with interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRootCallDispatch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: IRootDispatch2 = new ARootDispatch2()
      let b: IRootDispatch2 = new BRootDispatch2()
      expect(a.fld).assertEqual("abc");
      expect(a.met()).assertEqual(1);
      expect(b.fld).assertEqual("def");
      expect(b.met()).assertEqual(2);
    });
  })
}