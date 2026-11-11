/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import emulatorDdk from 'libemulatorddk.so'

export default function baseDdkTest() {
  describe('baseDdkTest', () => {
    const TAG: string = "[baseDdkTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;

    beforeAll(() => {
      console.info('baseDdkTest beforeAll called');
    })

    afterAll(() => {
      console.info('baseDdkTest afterAll called');
    })

    /**
     * @tc.name   testDdkCreateAshmem001
     * @tc.desc   verify OH_DDK_CreateAshmem returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testDdkCreateAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.ddkCreateAshmem()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testDdkMapAshmem001
     * @tc.desc   verify OH_DDK_MapAshmem returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testDdkMapAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.ddkMapAshmem()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testDdkUnmapAshmem001
     * @tc.desc   verify OH_DDK_UnmapAshmem returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testDdkUnmapAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.ddkUnmapAshmem()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testDdkDestroyAshmem001
     * @tc.desc   verify OH_DDK_DestroyAshmem returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testDdkDestroyAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.ddkDestroyAshmem()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });
  })
}