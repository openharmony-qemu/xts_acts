import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';


enum SomeEnum {a, b, c}

enum SomeEnum1: int {a = 0, b = 1, c = 2}

enum SomeEnum2: long {a = 0, b = 1, c = 2}

enum SomeEnum3: double {a = 0.0, b = 1.0, c = 2.0}


function foo(i: int) {
  return 1;
}
function bar(i: int, j?: string) {
  return 2;
}

function bar1(i?: int, j?: string) {
  return 2;
}

function foo(i: int, j: string) {
  return 1;
}
function bar2(i: int, j?: string) {
  return 2;
}

function bar3(i?: int, j?: string) {
  return 2;
}

class C {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}

class A {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}
class B extends A {
  constructor() { super() }
  constructor(name: string) {
    super(name)
  }
}

class E<in T> {}

class E1<out T> {}

export default function AssignabilityTest(): void {
  describe('AssignabilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0100
     * @tc.name      testConversionsAssignability0001
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0001';

      let t1: byte = 0
      let t2: short = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0200
     * @tc.name      testConversionsAssignability0002
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0002';

      let t1: byte = 0
      let t2: Int = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0300
     * @tc.name      testConversionsAssignability0003
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0003';

      let t1: byte = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0400
     * @tc.name      testConversionsAssignability0004
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0004';

      let t1: byte = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0500
     * @tc.name      testConversionsAssignability0005
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0005';

      let t1: byte = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0600
     * @tc.name      testConversionsAssignability0006
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0006';

      let t1: short = 0
      let t2: int = t1


    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0700
     * @tc.name      testConversionsAssignability0007
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0007';

      let t1: short = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0800
     * @tc.name      testConversionsAssignability0008
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0008';

      let t1: short = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0900
     * @tc.name      testConversionsAssignability0009
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0009';

      let t1: short = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1000
     * @tc.name      testConversionsAssignability0010
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0010';

      let t1: int = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1100
     * @tc.name      testConversionsAssignability0011
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0011';

      let t1: int = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1200
     * @tc.name      testConversionsAssignability0012
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0012';

      let t1: int = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1300
     * @tc.name      testConversionsAssignability0013
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0013';

      let t1: long = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1400
     * @tc.name      testConversionsAssignability0014
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0014';

      let t1: long = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1500
     * @tc.name      testConversionsAssignability0015
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0015';

      let t1: float = 0.0f
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1600
     * @tc.name      testConversionsAssignability0016
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0016';

      let t1: SomeEnum = SomeEnum.a
      let t2: int = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1700
     * @tc.name      testConversionsAssignability0017
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0017';

      let t1: SomeEnum = SomeEnum.a
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1800
     * @tc.name      testConversionsAssignability0018
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0018';

      let t1: SomeEnum = SomeEnum.a
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1900
     * @tc.name      testConversionsAssignability0019
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0019';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2000
     * @tc.name      testConversionsAssignability0020
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0020';

      let t1: SomeEnum = SomeEnum.a
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2100
     * @tc.name      testConversionsAssignability0021
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0021';

      let t1: SomeEnum = SomeEnum.a
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2200
     * @tc.name      testConversionsAssignability0022
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0022';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2300
     * @tc.name      testConversionsAssignability0023
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0023';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2400
     * @tc.name      testConversionsAssignability0024
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0024';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2500
     * @tc.name      testConversionsAssignability0025
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0025';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0300
     * @tc.name      testFunctionsCompatibilityOpt0003
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testFunctionsCompatibilityOpt0003';

      let x2: (i2: int, j2: string) => int = bar2;
      expect(x2(1, "knock-knock")).assertEqual(2);

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0400
     * @tc.name      testFunctionsCompatibilityOpt0004
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testFunctionsCompatibilityOpt0004';

      let x3: (i: int, j: string) => int = bar3;
      expect(x3(1, "who`s there")).assertEqual(2);

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0100
     * @tc.name      testIdenticalAssignability0001
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0001';

      let t1: string[] = ["a", "b", "c"]
      let t2: Array<string> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0200
     * @tc.name      testIdenticalAssignability0002
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0002';

      let t1: number[] = [1, 2, 3]
      let t2: Array<number> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0300
     * @tc.name      testIdenticalAssignability0003
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0003';

      let t1: boolean[] = [true, false, true]
      let t2: Array<boolean> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0400
     * @tc.name      testIdenticalAssignability0004
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0004';

      let t1: C[] = [new C("John")]
      let t2: Array<C> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0500
     * @tc.name      testIdenticalAssignability0005
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0005';

      let t1: [string, number] = ["hello", 42]
      let t2: [string, number] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0600
     * @tc.name      testIdenticalAssignability0006
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0006';

      let t1: [boolean, string, number] = [true, "test", 100]
      let t2: [boolean, string, number] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0700
     * @tc.name      testIdenticalAssignability0007
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0007';

      let t1: [string, number] = ["test", 42]
      let t2: [string, number] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0800
     * @tc.name      testIdenticalAssignability0008
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0008';

      let t1: string | number = "hello"
      let t2: number | string = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_0900
     * @tc.name      testIdenticalAssignability0009
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0009';

      let t1: "success" | "error" | "loading" = "success"
      let t2: "error" | "loading" | "success" = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1000
     * @tc.name      testIdenticalAssignability0010
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0010';

      let t1: boolean | null | undefined = true
      let t2: undefined | null | boolean = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1100
     * @tc.name      testIdenticalAssignability0011
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0011';

      let t1: C | number = new C("John")
      let t2: number | C = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1200
     * @tc.name      testIdenticalAssignability0012
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0012';

      let t1: (string | number)[][] = [["a"], [1]]
      let t2: Array<Array<string | number>> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1300
     * @tc.name      testIdenticalAssignability0013
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0013';

      let t1: [string | number, boolean] = ["test", true]
      let t2: [number | string, boolean] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1400
     * @tc.name      testIdenticalAssignability0014
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0014';

      let t1: (x: string) => number = (x: string) => x.length
      let t2: (param: string) => number = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1500
     * @tc.name      testIdenticalAssignability0015
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0015';

      let t1: "hello" = "hello"
      let t2: "hello" = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1600
     * @tc.name      testIdenticalAssignability0016
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0016';

      let t1: "42" = "42"
      let t2: "42" = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1700
     * @tc.name      testIdenticalAssignability0017
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0017';

      let t1: undefined = undefined
      let t2: undefined = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1800
     * @tc.name      testIdenticalAssignability0018
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0018';

      let t1: () => void = () => {}
      let t2: () => void = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_1900
     * @tc.name      testIdenticalAssignability0019
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0019';

      let t1: (a: number) => string = (a: number) => a.toString()
      let t2: (x: number) => string = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_2000
     * @tc.name      testIdenticalAssignability0020
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0020';

      let t1: C = { name: "Alice"}
      let t2: C = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_2100
     * @tc.name      testIdenticalAssignability0021
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0021';

      let t1: Promise<string> = Promise.resolve("hello")
      let t2: Promise<string> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_2200
     * @tc.name      testIdenticalAssignability0022
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0022';

      let t1: Map<string, number> = {"string": 1}
      let t2: Map<string, number> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_2300
     * @tc.name      testIdenticalAssignability0023
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0023';

      let t1: Array<string | number> = ["a", 1, "b"]
      let t2: (string | number)[] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_IDENTICAL_ASSIGNABILITY_2400
     * @tc.name      testIdenticalAssignability0024
     * @tc.desc      Type T1 is assignable to type T2 if T1 is identical to T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIdenticalAssignability0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testIdenticalAssignability0024';

      let t1: [Array<string>, number] = [["a", "b"], 42]
      let t2: [string[], number] = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0100
     * @tc.name      testSubtypingAssignability0001
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0001';

      let t1: FixedArray<"a"|"b"|"c"> = ["a", "b", "c"]
      let t2: FixedArray<string> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0200
     * @tc.name      testSubtypingAssignability0002
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0002';

      let t1: FixedArray<B> = [new B(), new B("John")]
      let t2: FixedArray<A> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0300
     * @tc.name      testSubtypingAssignability0003
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0003';

      let t1: FixedArray<E<A>> = [new E<A>(), new E<A>()]
      let t2: FixedArray<E<B>> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0400
     * @tc.name      testSubtypingAssignability0004
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0004';

      let t1: FixedArray<E1<B>> = [new E1<B>(), new E1<B>()]
      let t2: FixedArray<E1<A>> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0500
     * @tc.name      testSubtypingAssignability0005
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0005';

      let t1: string = "hello"
      let t2: number | string = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0600
     * @tc.name      testSubtypingAssignability0006
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0006';

      let t1: "success" | "loading" = "success"
      let t2: "error" | "loading" | "success" = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0700
     * @tc.name      testSubtypingAssignability0007
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0007';

      let t1: B = new B()
      let t2: A | B = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0800
     * @tc.name      testSubtypingAssignability0008
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0008';

      let t1: E1<B> = new E1<B>()
      let t2: E1<A> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_0900
     * @tc.name      testSubtypingAssignability0009
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0009';

      let t1: E<A> = new E<A>()
      let t2: E<B> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1000
     * @tc.name      testSubtypingAssignability0010
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0010';

      let t1: "hello" = "hello"
      let t2: string = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1100
     * @tc.name      testSubtypingAssignability0011
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0011';

      let t1: E1<"hello"> = new E1<"hello">()
      let t2: E1<string> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1200
     * @tc.name      testSubtypingAssignability0012
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0012';

      let t1: E<string> = new E<string>()
      let t2: E<"hello"> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1300
     * @tc.name      testSubtypingAssignability0013
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0013';

      let t1: (p: A) => B = (p: A): B => { return new B()}
      let t2: (p: B) => A = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1400
     * @tc.name      testSubtypingAssignability0014
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0014';

      let t1: (p?: A) => B = (p?: A): B => { return new B()}
      let t2: (p?: B) => A = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1500
     * @tc.name      testSubtypingAssignability0015
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0015';

      let t1: (q: A) => B = (q: A): B => { return new B()}
      let t2: (q: B, p?: A) => A = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1600
     * @tc.name      testSubtypingAssignability0016
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0016';

      let t1: (p: E<B>) => E<A> = (p: E<B>): E<A> => { return new E<A>()}
      let t2: (p: E<A>) => E<B> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1700
     * @tc.name      testSubtypingAssignability0017
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0017';

      let t1: (p: E1<A>) => E1<B> = (p: E1<A>): E1<B> => { return new E1<B>()}
      let t2: (p: E1<B>) => E1<A> = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1800
     * @tc.name      testSubtypingAssignability0018
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0018';

      let t1: A = {name: "Alice"}
      let t2: Object = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_1900
     * @tc.name      testSubtypingAssignability0019
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0019';

      let t1: E<B> = new E<B>()
      let t2: Object = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_SUBTYPING_ASSIGNABILITY_2000
     * @tc.name      testSubtypingAssignability0020
     * @tc.desc      Type T1 is assignable to type T2 if T1 is a subtype of T2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSubtypingAssignability0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSubtypingAssignability0020';

      let t1: E<A> = new E<A>()
      let t2: Object = t1

    });
  })
}
