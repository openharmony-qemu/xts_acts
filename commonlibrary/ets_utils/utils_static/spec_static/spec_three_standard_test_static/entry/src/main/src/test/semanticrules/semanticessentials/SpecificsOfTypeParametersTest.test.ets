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
} from '../../../../../hypium/index';

class Pos<T extends number> {
    constructor(x: T) {}
}

export default function SpecificsOfTypeParametersTest(): void {
    describe('SpecificsOfTypeParametersTest', () => {
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
         * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_TEST_0100
         * @tc.name      testPositiveCases0001
         * @tc.desc      Explicit type argument new Pos<number>(1) must be used to fix the code
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testPositiveCases0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
            let pos1 = new Pos<number>(1);
            let pos2 = new Pos<number>(new Number(1));
            let pos3 = new Pos<number>(1.0);
            expect(pos1 instanceof Pos).assertEqual(true);
            expect(pos2 instanceof Pos).assertEqual(true);
            expect(pos3 instanceof Pos).assertEqual(true);
        });
    });
}
