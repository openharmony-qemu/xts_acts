import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import { A } from './file_A9.ets'
import { B } from './file_B10.ets'
import { B1 } from './file_B11.ets'


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}



export default function MetTest():void {
  describe('MetTest', () => {
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
     * @tc.number    SUB_MET_ONE_TEST_0100
     * @tc.name      testMet0001
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMet0001';
      expect(new A().foo(42)).assertEqual(84)
    });

    /**
     * @tc.number    SUB_MET_ONE_TEST_0200
     * @tc.name      testMet0002
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMet0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMet0002';
      expect(new B().foo(42)).assertEqual(126)
    });

    /**
     * @tc.number    SUB_MET_ONE_TEST_0300
     * @tc.name      testMet0003
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMet0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMet0003';
      expect(new B1().foo(42)).assertEqual(126)
    });
  })
}
