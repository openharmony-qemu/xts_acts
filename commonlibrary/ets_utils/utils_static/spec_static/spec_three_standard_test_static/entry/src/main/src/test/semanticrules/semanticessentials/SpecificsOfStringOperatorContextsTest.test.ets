'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
    afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '@ohos/hypium-binary/src/main/indexStatic';

enum Direction {
    Up,
    Down
}

export default function SpecificsOfStringOperatorContextsTest(): void {
    describe('SpecificsOfStringOperatorContextsTest', () => {
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
         * @tc.number    SUB_SPECIFICS_OF_STRING_OPERATOR_CONTEXTS_TEST_0100
         * @tc.name      testStringConcatenation0001
         * @tc.desc      "If one operand of the binary operator \u2018+\u2019 is of type string, then\
         *               \ the string conversion applies to another non-string operand to convert it to string"
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testStringConcatenation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
            let b: number = 1;
            let s: number = 2;
            let i: number = 3;
            let l: number = 4;
            let s1 = "ok";
            let s2 = `lorem
                ipsum`;

            expect((b + s1) instanceof string).assertTrue();
            expect((s + i + s2) instanceof string).assertTrue();
            expect((i + "yes" + l) instanceof string).assertTrue();
            expect((b * i + s1 + l) instanceof string).assertTrue();
            expect((s1 + Direction.Up) instanceof string).assertTrue();
            expect((s1 + null) instanceof string).assertTrue();
        });
    })
}
