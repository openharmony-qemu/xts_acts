import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class C {
  foo(): int {
    return 1
  }
}

interface I {
  foo(): int {  // default implementation
  return 2
}
}

abstract class X extends C implements I {
  abstract foo(): int  // Here abstract foo() overrides both foo()
  // coming from class C and interface I
}

class Y extends X {
  foo(): int {
    return 11
  }
}


export default function AbstractMethodsTest():void {
  describe('AbstractMethodsTest', () => {
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

    /**
     * @tc.number    SUB_ABSTRACT_METHODSTEST_0100
     * @tc.name      testAbstractMethods0001
     * @tc.desc      An abstract method can override non-abstract methods inherited from base classes or base interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAbstractMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAbstractMethods0001';
      let y: Y = new Y();
      expect(y.foo()).assertEqual(11);
      let x: X = y;
      expect(x.foo()).assertEqual(11);
      let c: C = y;
      expect(c.foo()).assertEqual(11);
      let i: I = y;
      expect(i.foo()).assertEqual(11);
    });
  })
}