import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class E {
  e: string = 'e'
}
class F extends E {
  e: string = 'f'
}
class K extends F {
  e: string = 'k'
}


abstract class A {
  abstract a(f: K): E;
}


abstract class B extends A {
  abstract a(f: F): F;
}

class C extends B {
  a(f: E): K {
    return f as K
  }
}

class C1 extends B {
  a(f: E): K {
    return f as K
  }
}

class C2 extends B {
  a(f: F): F {
    return f
  }
}

abstract class A1 {
  abstract a(f: K): F;
}


abstract class B1 extends A1 {
  abstract a(f: F): K;
}

class C3 extends B1 {
  a(f: E): K {
    return f as K
  }
}

abstract class A2 {
  abstract a(f: K): E;
}


abstract class B2 extends A2 {
  abstract a(f: F): E;
}

class C4 extends B2 {
  a(f: E): E {
    return f
  }
}

class A3 {
  a(f: K): E {
    return new E()
  }
}


abstract class B3 extends A3 {
  abstract a(f: F): F;
}

class C5 extends B3 {
  a(f: E): K {
    return f as K
  }
}

class C6 extends B3 {
  a(f: F): K {
    return f as K
  }
}

class C7 extends B3 {
  a(f: F): F {
    return f
  }
}

class A4 {
  a(f: K): F {
    return new F()
  }
}


abstract class B4 extends A4 {
  abstract a(f: F): K;
}

class C8 extends B4 {
  a(f: E): K {
    return f as K
  }
}

class A5 {
  a(f: K): E {
    return new E()
  }
}


abstract class B5 extends A5 {
  abstract a(f: F): E;
}

class C9 extends B5 {
  a(f: E): E {
    return f
  }
}

class E1 {
  e(): string { return 'e' }
}
class F1 extends E1 {
  e(): string { return 'f' }
}
class K1 extends F1 {
  e(): string { return 'k' }
}


abstract class A6 {
  abstract a(f: K1): E1;
}


abstract class B6 extends A6 {
  abstract a(f: F1): F1;
}

class C10 extends B6 {
  a(f: E1): K1 {
    return f as K1
  }
}

class C11 extends B6 {
  a(f: F1): K1 {
    return f as K1
  }
}

class C12 extends B6 {
  a(f: F1): F1 {
    return f
  }
}

abstract class A7 {
  abstract a(f: K1): F1;
}


abstract class B7 extends A7 {
  abstract a(f: F1): K1;
}

class C13 extends B7 {
  a(f: E1): K1 {
    return f as K1
  }
}

abstract class A8 {
  abstract a(f: K1): E1;
}


abstract class B8 extends A8 {
  abstract a(f: F1): E1;
}

class C14 extends B8 {
  a(f: E1): E1 {
    return f
  }
}

class A9 {
  a(f: K1): E1 {
    return new E1()
  }
}


abstract class B9 extends A9 {
  abstract a(f: F1): F1;
}

class C15 extends B9 {
  a(f: E1): K1 {
    return f as K1
  }
}

class C16 extends B9 {
  a(f: F1): F1 {
    return f
  }
}

class A10 {
  a(f: K1): F1 {
    return new F1()
  }
}


abstract class B10 extends A10 {
  abstract a(f: F1): K1;
}

class C17 extends B10{
  a(f: E1): K1 {
    return f as K1
  }
}

class A11 {
  a(f: K1): E1 {
    return new E1()
  }
}

abstract class B11 extends A11 {
  abstract a(f: F1): E1;
}

class C18 extends B11 {
  a(f: E1): E1 {
    return f
  }
}

abstract class A12 {
  abstract a(): int;
}

interface D {
  d(): int {
  return 1;
}
}

class B12 extends A12 implements D {
  override a(): int {
    return 1;
  }

  fee(): int {
    return this.a() + this.d();
  }
}

class A13 {
  public foo(): int {
    return 1;
  }
}

class B13 extends A13 {

}

class C19 extends B13 {
  fee(): int {
    return this.foo();
  }
}

class B14 extends A13 {
  fee(): int {
    return this.foo();
  }
}

class A14 {
  protected foo(): int {
    return 1;
  }
}

class B15 extends A14 {
  fee(): int {
    return this.foo();
  }
}

class A15 {
  public static foo(): int {
    return 1;
  }
}

class B16 extends A15 {
  fee(): int {
    return A15.foo();
  }
}

class A16 {
  protected static foo(): int {
    return 1;
  }
}

class B17 extends A16 {
  fee(): int {
    return A16.foo();
  }
}


export default function InheritanceTest():void {
  describe('InheritanceTest', () => {
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
     * @tc.number    SUB_INHERITANCETEST_0100
     * @tc.name      testInheritance0001
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0001';

      const c: C = new C()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0200
     * @tc.name      testInheritance0002
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0002';

      const c: C1 = new C1()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0300
     * @tc.name      testInheritance0003
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0003';

      const c: C2 = new C2()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof F).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0400
     * @tc.name      testInheritance0004
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0004';

      const c: C2 = new C2()
      const e: E = c.a(new F())
      expect(e.e).assertEqual('f');
      expect(e instanceof F).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0500
     * @tc.name      testInheritance0005
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0005';

      const c: C3 = new C3()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0600
     * @tc.name      testInheritance0006
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0006';

      const c: C4 = new C4()
      const e: E = c.a(new E())
      expect(e.e).assertEqual('e');
      expect(e instanceof E).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0700
     * @tc.name      testInheritance0007
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0007';

      const c: C5 = new C5()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0800
     * @tc.name      testInheritance0008
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0008';

      const c: C6 = new C6()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_0900
     * @tc.name      testInheritance0009
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0009';

      const c: C7 = new C7()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof F).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1000
     * @tc.name      testInheritance0010
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0010';

      const c: C7 = new C7()
      const e: E = c.a(new F())
      expect(e.e).assertEqual('f');
      expect(e instanceof F).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1100
     * @tc.name      testInheritance0011
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0011';

      const c: C8 = new C8()
      const e: E = c.a(new K())
      expect(e.e).assertEqual('k');
      expect(e instanceof K).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1200
     * @tc.name      testInheritance0012
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0012';

      const c: C9 = new C9()
      const e: E = c.a(new E())
      expect(e.e).assertEqual('e');
      expect(e instanceof E).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1300
     * @tc.name      testInheritance0013
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0013';

      const c: C10 = new C10()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1400
     * @tc.name      testInheritance0014
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0014';

      const c: C11 = new C11()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1500
     * @tc.name      testInheritance0015
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0015';

      const c: C12 = new C12()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof F1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1600
     * @tc.name      testInheritance0016
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0016';

      const c: C12 = new C12()
      const e: E1 = c.a(new F1())
      expect(e.e()).assertEqual('f');
      expect(e instanceof F1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1700
     * @tc.name      testInheritance0017
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0017';

      const c: C13 = new C13()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1800
     * @tc.name      testInheritance0018
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0018';

      const c: C14 = new C14()
      const e: E1 = c.a(new E1())
      expect(e.e()).assertEqual('e');
      expect(e instanceof E1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_1900
     * @tc.name      testInheritance0019
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0019';

      const c: C15 = new C15()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2000
     * @tc.name      testInheritance0020
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0020';

      const c: C15 = new C15()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2100
     * @tc.name      testInheritance0021
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0021';

      const c: C16 = new C16()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof F1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2200
     * @tc.name      testInheritance0022
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0022';

      const c: C16 = new C16()
      const e: E1 = c.a(new F1())
      expect(e.e()).assertEqual('f');
      expect(e instanceof F1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2300
     * @tc.name      testInheritance0023
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0023';

      const c: C17 = new C17()
      const e: E1 = c.a(new K1())
      expect(e.e()).assertEqual('k');
      expect(e instanceof K1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2400
     * @tc.name      testInheritance0024
     * @tc.desc      Inheritance method multiple level with overriding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0024';

      const c: C18 = new C18()
      const e: E1 = c.a(new E1())
      expect(e.e()).assertEqual('e');
      expect(e instanceof E1).assertTrue();
    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2500
     * @tc.name      testInheritance0025
     * @tc.desc      Inheritance abstract method of superclass and default methods from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0025';
      let instance: B12 = new B12();
      expect( instance.fee()).assertEqual(2);


    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2600
     * @tc.name      testInheritance0026
     * @tc.desc      Inheritance method of superclass that not a member of direct superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0026';
      let instance: C19 = new C19();
      expect( instance.fee()).assertEqual(1);


    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2700
     * @tc.name      testInheritance0027
     * @tc.desc      Inheritance abstract method of superclass and default methods from superinterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0027';
      let instance: B14 = new B14();
      expect( instance.fee()).assertEqual(1);


    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2800
     * @tc.name      testInheritance0028
     * @tc.desc      Inheritance method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0028';
      let instance: B15 = new B15();
      expect( instance.fee()).assertEqual(1);


    });

    /**
     * @tc.number    SUB_INHERITANCETEST_2900
     * @tc.name      testInheritance0029
     * @tc.desc      Inheritance static method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0029';
      let instance: B16 = new B16();
      expect( instance.fee()).assertEqual(1);


    });

    /**
     * @tc.number    SUB_INHERITANCETEST_3000
     * @tc.name      testInheritance0030
     * @tc.desc      Inheritance static method of superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInheritance0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInheritance0030';
      let instance: B17 = new B17();
      expect( instance.fee()).assertEqual(1);


    });
  })
}
