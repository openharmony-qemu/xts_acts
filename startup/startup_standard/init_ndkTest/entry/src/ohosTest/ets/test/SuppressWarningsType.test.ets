import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { SuppressWarningsType } from '@ohos.annotation';

export default function SuppressWarningsTypeTest() {
    describe('SuppressWarningsTypeTest', () => {
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
         * @tc.number SuppressWarningsType_TEST_001
         * @tc.name testEnumTypeAndExport
         * @tc.desc Verify the import and type correctness of SuppressWarningsType enum
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('testEnumTypeAndExport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            expect(SuppressWarningsType).not().assertUndefined();
            expect(typeof SuppressWarningsType).assertEqual('object');
        });

        /**
         * @tc.number SuppressWarningsType_TEST_002
         * @tc.name testCompatibilityEnumValue
         * @tc.desc Verify the accuracy of COMPATIBILITY enum value, must be strictly equal to 'compatibility'
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('testCompatibilityEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            expect(SuppressWarningsType.COMPATIBILITY).assertEqual('compatibility');
            expect(typeof SuppressWarningsType.COMPATIBILITY).assertEqual('string');
        });

        /**
         * @tc.number SuppressWarningsType_TEST_003
         * @tc.name testEnumFieldIntegrity
         * @tc.desc Verify the integrity of enum fields, only contains COMPATIBILITY field, no extra/missing fields
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('testEnumFieldIntegrity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            const enumKeys = Object.keys(SuppressWarningsType);
            expect(enumKeys.length).assertEqual(1);
            expect(enumKeys[0]).assertEqual('COMPATIBILITY');
            expect(enumKeys.includes('UNDEFINED_FIELD')).assertEqual(false);
        });

    });
}