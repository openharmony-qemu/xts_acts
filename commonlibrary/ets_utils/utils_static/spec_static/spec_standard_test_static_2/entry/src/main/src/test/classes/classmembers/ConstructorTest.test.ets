import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import { A } from './file_A3.ets'
import { B } from './file_B4.ets'
import { B1 } from './file_B5.ets'


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}



export default function ConstructorTest():void {
  describe('ConstructorTest', () => {
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
     * @tc.number    SUB_CONSTRUCTORTEST_0100
     * @tc.name      testConstructor0001
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConstructor0001';

      // separate module, positive case with public constructor
      expect(new A(42).fld).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CONSTRUCTORTEST_0200
     * @tc.name      testConstructor0002
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConstructor0002';

      // separate module, positive case with public accessor, from subclass
      expect(new B(42).fld).assertEqual(43)
    });

    /**
     * @tc.number    SUB_ACCTEST_0300
     * @tc.name      testAcc0003
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAcc0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAcc0003';

      // separate module, positive case with protected constructor, from subclass
      expect(new B1(42).fld).assertEqual(43)
    });
  })
}
