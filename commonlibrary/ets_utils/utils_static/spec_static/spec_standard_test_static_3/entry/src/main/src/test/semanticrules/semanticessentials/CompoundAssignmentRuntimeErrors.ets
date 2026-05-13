import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function CompoundAssignmentRuntimeErrors(): void {
  describe('CompoundAssignmentRuntimeErrors', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_RUNTIME_ERRORS_0100
     * @tc.name      testCompoundAssignmentRuntimeErrors0001
     * @tc.desc      Cannot divide by zero in compound assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentRuntimeErrors0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 10;

      try {
        a /= 0;
        expect().assertFail();
      } catch (e) {
        expect((e as Error).message).assertEqual("/ by zero");
      }
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_RUNTIME_ERRORS_0200
     * @tc.name      testCompoundAssignmentRuntimeErrors0002
     * @tc.desc      Cannot modulo by zero in compound assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentRuntimeErrors0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 10;

      try {
        a %= 0;
        expect().assertFail();
      } catch (e) {
        expect((e as Error).message).assertEqual("/ by zero");
      }
    });
  })
}