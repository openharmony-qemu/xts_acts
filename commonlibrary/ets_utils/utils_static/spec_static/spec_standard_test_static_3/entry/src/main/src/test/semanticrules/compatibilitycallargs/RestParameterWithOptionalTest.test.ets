import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
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
function foo1(a?: number, ...rest: Array<string>) {
  if (a == undefined && rest.length == 0) {
    return 1
  }
  else {
    return 0
  }
}

function foo2(x: string, a?: number, ...rest: Array<string>) {
  if (a == undefined && rest.length == 0) {
    return 1
  }
  else {
    return 0
  }
}

function foo3(a?: number, b?: string, ...rest: Array<string>) {
  if (a == undefined && b == undefined && rest.length == 0) {
    return 2;
  }
  else if (b == undefined && rest.length == 0) {
    return 1;
  }
  else {
    return 0;
  }
}
function foo4(x: string, a?: number, b?: string, ...rest: Array<string>) {
  if (a == undefined && b == undefined && rest.length == 0) {
    return 2;
  }
  else if (b == undefined && rest.length == 0) {
    return 1;
  }
  else {
    return 0;
  }
}
function foo5(a?: number, b?: string, c?: number, ...rest: Array<string>) {
  if (a == undefined && b == undefined && c == undefined && rest.length == 0) {
    return 3;
  }
  else if (b == undefined && c == undefined && rest.length == 0) {
    return 2;
  }
  else if (c == undefined && rest.length == 0) {
    return 1;
  }
  else {
    return 0;
  }
}
function foo6(x: string, a?: number, b?: string, c?: number, ...rest: Array<string>) {
  if (a == undefined && b == undefined && c == undefined && rest.length == 0) {
    return 3;
  }
  else if (b == undefined && c == undefined && rest.length == 0) {
    return 2;
  }
  else if (c == undefined && rest.length == 0) {
    return 1;
  }
  else {
    return 0;
  }
}
function foo7(x: string, y: string, a?: number, b?: string, c?: number, ...rest: Array<string>) {
  if (a == undefined && b == undefined && c == undefined && rest.length == 0) {
    return 3;
  }
  else if (b == undefined && c == undefined && rest.length == 0) {
    return 2;
  }
  else if (c == undefined && rest.length == 0) {
    return 1;
  }
  else {
    return 0;
  }
}






export default function RestParameterWithOptionalTest(): void {
  describe('RestParameterWithOptionalTest', () => {
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
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0100
     * @tc.name      testRestParameterWithOptional0001
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0001';
      

      expect(foo1()).assertEqual(1);
      expect(foo1(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0200
     * @tc.name      testRestParameterWithOptional0002
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0002';
      

      expect(foo2("mandatory")).assertEqual(1);
      expect(foo2("mandatory", 1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0300
     * @tc.name      testRestParameterWithOptional0003
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0003';
      

      expect(foo3()).assertEqual(2);
      expect(foo3(1)).assertEqual(1);
      expect(foo3(1, "asdsad")).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0400
     * @tc.name      testRestParameterWithOptional0004
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0004';
      

      expect(foo4("mandatory")).assertEqual(2);
      expect(foo4("mandatory", 1)).assertEqual(1);
      expect(foo4("mandatory", 1, "asdsad")).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0500
     * @tc.name      testRestParameterWithOptional0005
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0005';
      

      expect(foo5()).assertEqual(3);
      expect(foo5(1)).assertEqual(2);
      expect(foo5(1, "asdasd")).assertEqual(1);
      expect(foo5(1, "asdsad", 2)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0600
     * @tc.name      testRestParameterWithOptional0006
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0006';
      

      expect(foo6("mandatory")).assertEqual(3);
      expect(foo6("mandatory", 1)).assertEqual(2);
      expect(foo6("mandatory", 1, "asdasd")).assertEqual(1);
      expect(foo6("mandatory", 1, "asdsad", 2)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_REST_PARAMETER_WITH_OPTIONAL_0700
     * @tc.name      testRestParameterWithOptional0007
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParameterWithOptionalTest0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRestParameterWithOptionalTest0007';
      

      expect(foo7("mandatory", "mandatory")).assertEqual(3);
      expect(foo7("mandatory", "mandatory", 1)).assertEqual(2);
      expect(foo7("mandatory", "mandatory", 1, "asdasd")).assertEqual(1);
      expect(foo7("mandatory", "mandatory", 1, "asdsad", 2)).assertEqual(0);
    });
  })
}

