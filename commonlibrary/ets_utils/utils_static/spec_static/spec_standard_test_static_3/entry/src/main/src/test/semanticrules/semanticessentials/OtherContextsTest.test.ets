import {
    afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';


class Base {}
class Derived extends Base {}
function want_base(x: Base) {}

export default function OtherContextsTest(): void {
    describe('OtherContextsTest', () => {
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
         * @tc.number    OTHER_CONTEXTS_TEST_0100
         * @tc.name      testSubtyping0001
         * @tc.desc      The only semantic rule for all other contexts, and specifically for Overriding,
         *               is to use Subtyping.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testSubtyping0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const TAG = 'testSubtyping0001';

            let a = new Base()
            let b: Base = new Derived()
            let c: Derived = new Derived()
            want_base(a)
            want_base(b)
            want_base(c)
        });
    })
}
