import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  foo(): int {
    return 1;
  }
}

final class B extends A {
  override foo(): int {
    return 5;
  }
}

function getB(): B {
  return new B
}

class A1 {
  foo(): int {
    return 1;
  }
}

final class B1 extends A1 {
  override final foo(): int {
    return 5;
  }
}

class A2 {
  /* @ label */foo(a: int = 2): int {
  return a;
}
}

final class B2 extends A2 {
  override foo(a: int = 2): int {
    return a;
  }
}

class A3 {
  /* @ label */foo(a: int = 2): int {
  return a;
}
}

final class B3 extends A3 {
  override foo(a: int = 2): int {
    return a;
  }
}

class A4 {
  /* @ label */foo(a?: int): int | undefined {
  return a;
}
}

final class B4 extends A4 {
  override foo(a?: int): int | undefined {
    return a;
  }
}

class A5 {
  /* @ label */foo(a?: int): int | undefined {
  return a;
}
}

final class B5 extends A5 {
  override foo(a: int | undefined = undefined): int | undefined {
    return a;
  }
}

class A6 {
  /* @ label */foo(a: int | undefined = undefined): int | undefined {
  return a;
}
}

final class B6 extends A6 {
  override foo(a?: int): int | undefined {
    return a;
  }
}

class A7 {
  foo(): int {
    return 1;
  }
}

final class B7 extends A7 {
  foo(): int {
    return 5;
  }
}

function getB1(): B7 {
  return new B7
}


export default function OverridingMethodsTest():void {
  describe('OverridingMethodsTest', () => {
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
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0100
     * @tc.name      testOverridingByInstanceMethods0001
     * @tc.desc      Override method declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0001';
      let instance: A = getB();
      expect(instance.foo()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0200
     * @tc.name      testOverridingByInstanceMethods0002
     * @tc.desc      Override method declaration with keyword final
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0002';
      let a: A1 = (() => new B1)()
      expect(a.foo()).assertEqual(5)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0300
     * @tc.name      testOverridingByInstanceMethods0003
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0003';
      let b: A2 = new B2()
      expect(b.foo()).assertEqual(2)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0400
     * @tc.name      testOverridingByInstanceMethods0004
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0004';
      let b: A3 = new B3()
      expect(b.foo(5)).assertEqual(5)



    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0500
     * @tc.name      testOverridingByInstanceMethods0005
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0005';
      let b: A4 = new B4()
      expect(b.foo()).assertEqual(undefined)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0600
     * @tc.name      testOverridingByInstanceMethods0006
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0006';
      let b: A4 = new B4()
      expect(b.foo(5)).assertEqual(5)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0700
     * @tc.name      testOverridingByInstanceMethods0007
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0007';
      let b: A5 = new B5()
      expect(b.foo()).assertEqual(undefined)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0800
     * @tc.name      testOverridingByInstanceMethods0008
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0008';
      let b: A6 = new B6()
      expect(b.foo()).assertEqual(undefined)

    });

    /**
     * @tc.number    SUB_OVERRIDING_BY_INSTANCE_METHODSTEST_0900
     * @tc.name      testOverridingByInstanceMethods0009
     * @tc.desc      Overriding methods with default parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingByInstanceMethods0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOverridingByInstanceMethods0009';
      let instance: A7 = getB1()
      expect(instance.foo()).assertEqual(5)

    });
  })
}