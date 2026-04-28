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

import { describe, beforeAll, expect, it, Level } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_APP_INDEX,
  INVALID_APP_INDEX,
  INVALID_WANT,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  AUTOSTARTAPP1,
  AUTOSTARTAPP2,
  TEST_BUNDLENAME,
  bundleNamesInit,
  BUNDLE_NAME_200,
  BUNDLE_NAME_201
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';
import sysDeviceInfo from '@ohos.deviceInfo';
import common from '@ohos.enterprise.common';
import { connection, statistics } from '@kit.NetworkKit';
import restrictions from '@ohos.enterprise.restrictions';

const APP_IDS_1: Array<string> = [
  "test_appid_1",
  "test_appid_2",
  "test_appid_3",
];
const LABEL_NOTIFICATION = "notification";

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    beforeAll((done: Function) => {
      bundleNamesInit();
      done();
    })

    /**
     * @tc.name   test_addHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0100
     * @tc.desc   test addHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0200
     * @tc.desc   test addHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0300
     * @tc.desc   test addHideLauncherIcon with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(null, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0400
     * @tc.desc   test addHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(undefined, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0500
     * @tc.desc   test addHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(INVALID_WANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0600
     * @tc.desc   test addHideLauncherIcon with null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0700
     * @tc.desc   test addHideLauncherIcon with undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0800
     * @tc.desc   test addHideLauncherIcon with empty bundleNames array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, []);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_0900
     * @tc.desc   test addHideLauncherIcon with bundleNames exceed limit(201 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, BUNDLE_NAME_201);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_1000
     * @tc.desc   test addHideLauncherIcon success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_addHideLauncherIcon_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 1).assertTrue();
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addHideLauncherIcon_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_JS_1100
     * @tc.desc   test addHideLauncherIcon with bundleNames within limit(200 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, BUNDLE_NAME_200);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 200).assertTrue();
        applicationManager.removeHideLauncherIcon(SELFWANT, BUNDLE_NAME_200);
        bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0100
     * @tc.desc   test removeHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0200
     * @tc.desc   test removeHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0300
     * @tc.desc   test removeHideLauncherIcon with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(null, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0400
     * @tc.desc   test removeHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(undefined, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0500
     * @tc.desc   test removeHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(INVALID_WANT, [TEST_BUNDLENAME]);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0600
     * @tc.desc   test removeHideLauncherIcon with null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0700
     * @tc.desc   test removeHideLauncherIcon with undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0800
     * @tc.desc   test removeHideLauncherIcon with empty bundleNames array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, []);
        let bundleNames = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_removeHideLauncherIcon_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_JS_0900
     * @tc.desc   test removeHideLauncherIcon with bundleNames exceed limit(201 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, BUNDLE_NAME_201);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0100
     * @tc.desc   test getHideLauncherIcon without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getHideLauncherIcon(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0200
     * @tc.desc   test getHideLauncherIcon with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        applicationManager.getHideLauncherIcon(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0300
     * @tc.desc   test getHideLauncherIcon with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getHideLauncherIcon(undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0400
     * @tc.desc   test getHideLauncherIcon with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getHideLauncherIcon(INVALID_WANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0500
     * @tc.desc   test getHideLauncherIcon success with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getHideLauncherIcon_0500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getHideLauncherIcon(SELFWANT);
        expect(Array.isArray(result)).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getHideLauncherIcon_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_JS_0600
     * @tc.desc   test getHideLauncherIcon success with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getHideLauncherIcon_0600", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: Array<string> = applicationManager.getHideLauncherIcon(null);
        expect(Array.isArray(result)).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  });
}