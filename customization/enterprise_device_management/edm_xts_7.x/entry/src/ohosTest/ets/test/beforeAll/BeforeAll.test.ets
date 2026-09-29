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

import { describe, beforeAll, expect, it, Level } from '@ohos/hypium-dynamic';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import { formHost, formInfo } from '@kit.FormKit';

let formInfos: formInfo.FormInfo[];

async function getAllFormsInfo() {
  try {
    await formHost.getAllFormsInfo().then((data: formInfo.FormInfo[]) => {
      console.info('formHost getAllFormsInfo success.');
      formInfos = data;
    }).catch((error: BusinessError) => {
      console.error(`error, code: ${error.code}, message: ${error.message}`);
    });
  } catch (error) {
    console.error(`catch error, code: ${error.code}, message: ${error.message}`);
  }
}

export default function beforeAllTest() {
  describe('beforeAll_test', () => {
    beforeAll(async (done: Function) => {
      await getAllFormsInfo();
      done();
    })

    /**
     * @tc.name   test_publishFormToDesktop_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_PUBLISHFORMTODESKTOP_JS_1200
     * @tc.desc   test publishFormToDesktop with dimension Dimension_1_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("test_publishFormToDesktop_1200", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        if (formInfos.length === 0) {
          return;
        }
        for (let data of formInfos) {
          if (data.defaultDimension === formInfo.FormDimension.Dimension_1_2) {
            let formInfoParam: applicationManager.FormInfo = {
              bundleName: data.bundleName,
              moduleName: data.moduleName,
              abilityName: data.abilityName,
              name: data.name,
              dimension: formInfo.FormDimension.Dimension_1_2
            };
            let result: string = applicationManager.publishFormToDesktop(formInfoParam);
            expect(result !== '').assertTrue();
            break;
          }
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_publishFormToDesktop_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_PUBLISHFORMTODESKTOP_JS_1300
     * @tc.desc   test publishFormToDesktop with dimension Dimension_2_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("test_publishFormToDesktop_1300", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        if (formInfos.length === 0) {
          return;
        }
        for (let data of formInfos) {
          if (data.defaultDimension === formInfo.FormDimension.Dimension_2_2) {
            let formInfoParam: applicationManager.FormInfo = {
              bundleName: data.bundleName,
              moduleName: data.moduleName,
              abilityName: data.abilityName,
              name: data.name,
              dimension: formInfo.FormDimension.Dimension_2_2
            };
            let result: string = applicationManager.publishFormToDesktop(formInfoParam);
            expect(result !== '').assertTrue();
            break;
          }
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_publishFormToDesktop_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_PUBLISHFORMTODESKTOP_JS_1400
     * @tc.desc   test publishFormToDesktop with dimension Dimension_2_4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("test_publishFormToDesktop_1400", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        if (formInfos.length === 0) {
          return;
        }
        for (let data of formInfos) {
          if (data.defaultDimension === formInfo.FormDimension.Dimension_2_4) {
            let formInfoParam: applicationManager.FormInfo = {
              bundleName: data.bundleName,
              moduleName: data.moduleName,
              abilityName: data.abilityName,
              name: data.name,
              dimension: formInfo.FormDimension.Dimension_2_4
            };
            let result: string = applicationManager.publishFormToDesktop(formInfoParam);
            expect(result !== '').assertTrue();
            break;
          }
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_publishFormToDesktop_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_PUBLISHFORMTODESKTOP_JS_1500
     * @tc.desc   test publishFormToDesktop with dimension Dimension_4_4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("test_publishFormToDesktop_1500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        if (formInfos.length === 0) {
          return;
        }
        for (let data of formInfos) {
          if (data.defaultDimension === formInfo.FormDimension.Dimension_4_4) {
            let formInfoParam: applicationManager.FormInfo = {
              bundleName: data.bundleName,
              moduleName: data.moduleName,
              abilityName: data.abilityName,
              name: data.name,
              dimension: formInfo.FormDimension.Dimension_4_4
            };
            let result: string = applicationManager.publishFormToDesktop(formInfoParam);
            expect(result !== '').assertTrue();
            break;
          }
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_publishFormToDesktop_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_PUBLISHFORMTODESKTOP_JS_1700
     * @tc.desc   test publishFormToDesktop with dimension DIMENSION_6_4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it("test_publishFormToDesktop_1700", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        if (formInfos.length === 0) {
          return;
        }
        for (let data of formInfos) {
          if (data.defaultDimension === formInfo.FormDimension.DIMENSION_6_4) {
            let formInfoParam: applicationManager.FormInfo = {
              bundleName: data.bundleName,
              moduleName: data.moduleName,
              abilityName: data.abilityName,
              name: data.name,
              dimension: formInfo.FormDimension.DIMENSION_6_4
            };
            let result: string = applicationManager.publishFormToDesktop(formInfoParam);
            expect(result !== '').assertTrue();
            break;
          }
        }
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}
