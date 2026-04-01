/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import avSession from '@ohos.multimedia.avsession';
import { BusinessError } from '@ohos.base';

export default function abilityTest() {
    describe('AVSessionCommonTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
            console.info(`${TAG}: beforeAll in`);
        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            console.info(`${TAG}: beforeEach in`);
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
            console.info(`${TAG}: afterEach in`);
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
            console.info(`${TAG}: afterAll in`);
        })


        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_BACKGROUNDPLAYMODE_STATIC_ENUM_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_BACKGROUNDPLAYMODE_STATIC_ENUM_0100
         * @tc.desc        compare all value in BackgroundPlayMode to number value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_BACKGROUNDPLAYMODE_STATIC_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG:string = '[SUB_MULTIMEDIA_AVSESSION_BACKGROUNDPLAYMODE_STATIC_ENUM_0100]';
            console.info(`TestLog: ENABLE_BACKGROUND_PLAY is ${avSession.BackgroundPlayMode.ENABLE_BACKGROUND_PLAY}`);
            expect(avSession.BackgroundPlayMode.ENABLE_BACKGROUND_PLAY).assertEqual(0 as avSession.BackgroundPlayMode);
            console.info(`TestLog: DISABLE_BACKGROUND_PLAY is ${avSession.BackgroundPlayMode.DISABLE_BACKGROUND_PLAY}`);
            expect(avSession.BackgroundPlayMode.DISABLE_BACKGROUND_PLAY).assertEqual(1 as avSession.BackgroundPlayMode);
            done();
        })


    })
}





