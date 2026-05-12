import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// let res: int = 0
//
// class Base {}
// class Derived extends Base {}
//
// interface IBase {
//   foo(i: Derived) { res = 1 }
// }
// interface IDerived {
//   foo(i: Base) { res = 2 }
// }
//
// class C implements IBase, IDerived {}

// interface IBase1 {
//   foo(i: Base) { res = 1 }
// }
// interface IDerived1 {
//   foo(i: Derived) { res = 2 }
// }
//
// class C1 implements IBase1, IDerived1 {}


export default function ImplementingInterfaceMethodsTest():void {
  describe('ImplementingInterfaceMethodsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // /**
    //  * @tc.number    SUB_IMPLEMENTING_INTERFACE_METHODSTEST_0100
    //  * @tc.name      testImplementingInterfaceMethods0001
    //  * @tc.desc      If superinterfaces have more then one default implementations (see Default Interface Method
    //  * Declarations) for some method m, then - The class that implements these interfaces has method that overrides m
    //  * (see Override-Compatible Signatures)
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testImplementingInterfaceMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const TAG = 'testImplementingInterfaceMethods0001';
    //
    //   res = 0
    //   new C().foo(new Base)
    //   expect(res).assertEqual(2)
    // });


    // /**
    //  * @tc.number    SUB_IMPLEMENTING_INTERFACE_METHODSTEST_0200
    //  * @tc.name      testImplementingInterfaceMethods0002
    //  * @tc.desc      If superinterfaces have more then one default implementations (see Default Interface Method
    //  * Declarations) for some method m, then - The class that implements these interfaces has method that overrides m
    //  * (see Override-Compatible Signatures)
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testImplementingInterfaceMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const TAG = 'testImplementingInterfaceMethods0002';
    //
    //   res = 0
    //   new C1().foo(new Derived)
    //   expect(res).assertEqual(2)
    // });

  })
}