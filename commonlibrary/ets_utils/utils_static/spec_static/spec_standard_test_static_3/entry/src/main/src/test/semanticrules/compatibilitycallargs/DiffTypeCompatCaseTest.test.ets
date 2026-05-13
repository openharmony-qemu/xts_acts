import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
import { Color } from '@kit.ArkUI';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity3(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity4(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity5(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity6(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity7(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity8(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
enum Color {
  Red,
  Green,
  Blue
}

function checkTypeIdentity9(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity10(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity11(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

export default function DiffTypeCompatCaseTest(): void {
  describe('DiffTypeCompatCaseTest', () => {
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
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0100
     * @tc.name      testDiffTypeCompatCase0001
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0001';

      const val1: Array<number> = [1, 2, 3];
      const val2: object = {};

      const result = checkTypeIdentity1(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0200
     * @tc.name      testDiffTypeCompatCase0002
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0002';

      const val1: boolean = true;
      const val2: number = 1;

      const result = checkTypeIdentity2(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0300
     * @tc.name      testDiffTypeCompatCase0003
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0003';

      const val1: number = 123;
      const val2: string = "123";

      const result = checkTypeIdentity3(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0400
     * @tc.name      testDiffTypeCompatCase0004
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0004';

      const val1: bigint = BigInt(123);
      const val2: number = 123;

      const result = checkTypeIdentity4(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0500
     * @tc.name      testDiffTypeCompatCase0005
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0005';

      const val1: Array<number> = [1, 2, 3];
      const val2: [number, number] = [1, 2];

      const result = checkTypeIdentity5(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0600
     * @tc.name      testDiffTypeCompatCase0006
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0006';

      const val1: string | number = 123;
      const val2: string  = "test";

      const result = checkTypeIdentity6(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0700
     * @tc.name      testDiffTypeCompatCase0007
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0007';

      const val1: object = {};
      const val2: null = null;

      const result = checkTypeIdentity7(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0800
     * @tc.name      testDiffTypeCompatCase0008
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0008';

      const val1: Function = () => {};
      const val2: object = {};

      const result = checkTypeIdentity8(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0900
     * @tc.name      testDiffTypeCompatCase0009
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0009';

      const val1: Color = Color.Red;
      const val2: number = 0;

      const result = checkTypeIdentity9(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_1000
     * @tc.name      testDiffTypeCompatCase0010
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0010';

      const val1: object = {};
      const val2: Array<number> = [1, 2, 3];

      const result = checkTypeIdentity10(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_1100
     * @tc.name      testDiffTypeCompatCase0011
     * @tc.desc      Ensuring type identity in type guards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeCompatCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeCompatCase0011';

      const val1: string = "hello";
      const val2: number = 123;

      const result = checkTypeIdentity11(val1, val2);
      expect(result).assertEqual(false);
    });
  })
}
