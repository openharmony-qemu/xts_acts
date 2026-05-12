import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

abstract class A {
  static a: int;

  static {
    A.a = 5;
  }
}

abstract class A1 {
  static a: int;

  static {
    for(let i = 0; i < 10; i++) {
      A1.a += i
    }
  }
}

abstract class A2 {
  static a: int

  static {
    switch (A2.a) {
      case 0: A2.a = 1; break
      default: A2.a = 2
    }
  }
}

abstract class A3 {
  public static a: int;

  static {
    try {
      A3.a = 5;
    } catch (e) {
      A3.a = 1
    }
  }
}

abstract class A4 {
  public static a: int;

  static {
    try {
      A4.a = 1;
      throw new Error
    } catch (e) {
      A4.a += 2
    } finally {
      A4.a += 3
    }
  }
}

abstract class A5 {
  static a: int;

  static {
    let i = 0
    while (i++ < 10) {
      A5.a += i
    }
  }
}

class A6 {
  public static a: int;

  static {
    try {
      A6.a = 5;
    } catch (e) {
      A6.a = 1
    }
  }
}

class A7 {
  static {
    A7.a = 1
  }
  static a: int
}

class A8 {
  public static x: int;

  static {
    A8.x = 5;
  }
}

class A9 {
  static a: int = 1
  static {
    let b = 3
    A9.a += b;
  }
}

class A10 {
  static a: int;

  static {
    for (let i = 0; i < 10; i++) {
      A10.a += i
    }
  }
}

class A11 {
  static a: int

  static {
    switch (A11.a) {
      case 0: A11.a = 1; break
      default: A11.a = 2
    }
  }
}

class A12 {
  public static a: int;

  static {
    try {
      A12.a = 5;
    } catch (e) {
      A12.a = 1
    }
  }
}

class A13 {
  public static a: int;

  static {
    try {
      A13.a = 1;
      throw new Error
    } catch (e) {
      A13.a += 2
    } finally {
      A13.a += 3
    }
  }
}

class A14 {
  static a: int;

  static {
    let i = 0
    while (i++ < 10) {
      A14.a += i
    }
  }
}

let res = ""

class A15 {
  static a: int = 0
  static {
    A15.a = 1
    res += "A"
  }
}

class B extends A15 {
  static b: int = 0
  static {
    B.b = 2
    res += "B"
  }
}

class C extends A15 {
  static c: int = 0
  static {
    C.c = 3
    res += "C"
  }
}

class D extends C {
  static d: int = 0
  static {
    D.d = 4
    res += "D"
  }
}

abstract class E {
  static e: int = 0
  static {
    E.e = 5
    res += "E"
  }
}

class F extends E {
  static f: int = 0
  static {
    F.f = 6
    res += "F"
  }
}

class G extends F {
  static g: int = 0
  static {
    G.g = 7
    res += "G"
  }
}

let res1 = ""

class A16 {
  static a: int = 0
  static {
    A16.a = 1
    res1 += "A"
  }
}

class B1 extends A16 {
  static b: int = 0
  static {
    B1.b = 2
    res1 += "B"
  }
}

class C1 extends A16 {
  static c: int = 0
  static {
    C1.c = 3
    res1 += "C"
  }
}

class D1 extends C1 {
  static d: int = 0
  static {
    D1.d = 4
    res1 += "D"
  }
}

abstract class E1 {
  static e: int = 0
  static {
    E1.e = 5
    res1 += "E"
  }
}

class F1 extends E1 {
  static f: int = 0
  static {
    F1.f = 6
    res1 += "F"
  }
}

class G1 extends F1 {
  static g: int = 0
  static {
    G1.g = 7
    res1 += "G"
  }
}


export default function ClassInitializerTest():void {
  describe('ClassInitializerTest', () => {
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
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0100
     * @tc.name      testClassInitializer0001
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed.
     * Abstract class case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0001';
      expect( A.a).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0200
     * @tc.name      testClassInitializer0002
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0002';
      expect(A1.a).assertEqual(45);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0300
     * @tc.name      testClassInitializer0003
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0003';
      expect(A2.a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0400
     * @tc.name      testClassInitializer0004
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0004';
      expect(A3.a).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0500
     * @tc.name      testClassInitializer0005
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0005';
      expect(A4.a).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0600
     * @tc.name      testClassInitializer0006
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0006';
      expect(A5.a).assertEqual(55);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0700
     * @tc.name      testClassInitializer0007
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0007';
      expect(A6.a).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0800
     * @tc.name      testClassInitializer0008
     * @tc.desc      Class initializer could be declared before declaring fields it works with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0008';
      expect(A7.a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_0900
     * @tc.name      testClassInitializer0009
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0009';
      expect(A8.x).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1000
     * @tc.name      testClassInitializer0010
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0010';
      expect(A9.a).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1100
     * @tc.name      testClassInitializer0011
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0011';
      expect(A10.a).assertEqual(45);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1200
     * @tc.name      testClassInitializer0012
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0012';
      expect(A11.a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1300
     * @tc.name      testClassInitializer0013
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0013';
      expect(A12.a).assertEqual(5);
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1400
     * @tc.name      testClassInitializer0014
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0014';
      expect(A13.a).assertEqual(6);
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1500
     * @tc.name      testClassInitializer0015
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0015';
      expect(A14.a).assertEqual(55);
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1600
     * @tc.name      testClassInitializer0016
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed along with
     * all class initializers of all superclasses. The order of execution is from the top superclass to the current
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0016';
      expect(B.b).assertEqual(2);
      expect(res).assertEqual("AB");
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_1700
     * @tc.name      testClassInitializer0017
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed along with
     * all class initializers of all superclasses. The order of execution is from the top superclass to the current
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0017';
      expect(B.b).assertEqual(2);
      expect(res).assertEqual("AB");
    })


    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_2000
     * @tc.name      testClassInitializer0020
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed along with
     * all class initializers of all superclasses. The order of execution is from the top superclass to the current
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0020';
      expect(E1.e).assertEqual(5);
      expect(res1).assertEqual("E");
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_2100
     * @tc.name      testClassInitializer0021
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed along with
     * all class initializers of all superclasses. The order of execution is from the top superclass to the current
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0021';
      expect(F1.f).assertEqual(6);
      expect(res1).assertEqual("EF");
    })

    /**
     * @tc.number    SUB_CLASS_INITIALIZERTEST_2200
     * @tc.name      testClassInitializer0022
     * @tc.desc      When a class is initialized, the class initializer declared in the class is executed along with
     * all class initializers of all superclasses. The order of execution is from the top superclass to the current
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassInitializer0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassInitializer0022';
      expect(G1.g).assertEqual(7);
      expect(res1).assertEqual("EFG");
    })


  })
}