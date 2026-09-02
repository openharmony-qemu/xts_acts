'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';

const BUNDLE_NAME = 'ohos.acts.bundle.test.static';
const ERROR_MESSAGE_PERMISSION_DENIED =
  'BusinessError 201: Permission denied. An attempt was made to GetBundleInstallStatus forbidden by permission: ohos.permission.GET_BUNDLE_INFO_PRIVILEGED.';
const TAG = 'testTag';
const TEST_SUITE_NAME = 'GetBundleInstallStatusNoPermissionStaticTest';

export default function getBundleInstallStatusNoPermissionTest() {
  describe('GetBundleInstallStatusNoPermissionStaticTest', (): void => {
    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_STATIC_NOPERM_0100
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_STATIC_NOPERM_0100
     * @tc.desc Verify error 201 without ohos.permission.GET_BUNDLE_INFO_PRIVILEGED.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_STATIC_NOPERM_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_STATIC_NOPERM_0100';
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        try {
          bundleManager.getBundleInstallStatus(BUNDLE_NAME);
          expect().assertFail();
          console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
          done();
        } catch (err) {
          const error = err as BusinessError;
          console.error(TAG + `${TEST_CASE_NAME} catch failed: code=${error.code}, message=${error.message}`);
          expect(error.code).assertEqual(201);
          expect(error.message).assertEqual(ERROR_MESSAGE_PERMISSION_DENIED);
          console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
          done();
        }
      });
  });
}
