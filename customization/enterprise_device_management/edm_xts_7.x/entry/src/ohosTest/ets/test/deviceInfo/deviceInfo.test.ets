/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium-dynamic';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import deviceInfo from '@ohos.enterprise.deviceInfo';
import sysDeviceInfo from '@ohos.deviceInfo';

const LABEL_DEVICE_NAME: string = 'deviceName';
const LABEL_DEVICE_SERIAL: string = 'deviceSerial';
const LABEL_SIM_INFO: string = 'simInfo';

export default function deviceInfoTest() {
  describe('deviceInfo_test', () => {
    /**
     * @tc.name   test_get_patch_info_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_PATCH_INFO_JS_0100
     * @tc.desc   test deviceInfo getPatchInfo without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_patch_info_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await deviceInfo.getPatchInfo();
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(9200001);
        }
      }
      done();
    });

    /**
     * @tc.name   test_get_patch_info_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_PATCH_INFO_JS_0200
     * @tc.desc   test deviceInfo getPatchInfo with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_patch_info_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await deviceInfo.getPatchInfo();
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(9200002);
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_get_patch_info_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_PATCH_INFO_JS_0300
     * @tc.desc   test deviceInfo getPatchInfo success with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_get_patch_info_0300", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let patchInfoList: Array<deviceInfo.PatchInfo> = await deviceInfo.getPatchInfo();
        expect(Array.isArray(patchInfoList)).assertTrue();
        for (let patchInfo of patchInfoList) {
          expect(typeof patchInfo.name === 'string').assertTrue();
          expect(typeof patchInfo.accountName === 'string').assertTrue();
          expect(typeof patchInfo.installTime === 'number').assertTrue();
          expect(Array.isArray(patchInfo.description.headers)).assertTrue();
          expect(Array.isArray(patchInfo.description.bodies)).assertTrue();
          for (let body of patchInfo.description.bodies) {
            expect(typeof body.title === 'string').assertTrue();
            expect(Array.isArray(body.contents)).assertTrue();
          }
        }
      } catch (error) {
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else if (error.code === 9200016) {
          expect(error.code).assertEqual(9200016);
        } else {
          expect(false).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}
