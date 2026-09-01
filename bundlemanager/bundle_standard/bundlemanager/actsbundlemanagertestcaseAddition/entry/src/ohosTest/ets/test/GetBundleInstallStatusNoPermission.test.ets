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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

const BUNDLE_NAME = 'ohos.acts.bundlemanagererrcode.test';

export default function getBundleInstallStatusNoPermissionTest() {
  describe('GetBundleInstallStatusNoPermissionTest', () => {
    /**
     * @tc.name getBundleInstallStatusNoPermission201
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_201
     * @tc.desc Verify error 201 without ohos.permission.GET_BUNDLE_INFO_PRIVILEGED.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('getBundleInstallStatusNoPermission201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          bundleManager.getBundleInstallStatus(BUNDLE_NAME);
          expect().assertFail();
        } catch (err) {
          const error = err as BusinessError;
          console.info(`getBundleInstallStatusNoPermission201: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(201);
        }
      });
  });
}
