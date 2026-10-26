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
import { describe, beforeAll, expect, it, Level } from '@ohos/hypium-dynamic';
import {
  BUNDLENAME1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM,
  EDM_INSTALL_PARAM_FOR_ALL_USER,
  HAP_FILE_PATH_ERROR,
  MARKET_APPS,
  ERROR_MARKET_APPS,
  bundleNamesInit,
  bundleNamesOneRealInit,
  BUNDLE_NAME_ONE_REAL_200,
  BUNDLE_NAME_201
} from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';
import systemparameter from '@ohos.systemparameter';
import { BusinessError } from '@kit.BasicServicesKit';

const DEFAULT_APP_ABILITY_NAME: string = 'EntryAbility';
const DEFAULT_APP_EMPTY_VALUE: string = '';
const DEFAULT_APP_INVALID_ACCOUNT_ID: number = -1;

export default function bundleManagerTest() {
  describe('bundleManager_test', () => {
    /**
     * @tc.name   test_setDefaultApplication_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0100
     * @tc.desc   test setDefaultApplication without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0100", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200001);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0200
     * @tc.desc   test setDefaultApplication with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200002);
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0300
     * @tc.desc   test setDefaultApplication with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(null, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0400
     * @tc.desc   test setDefaultApplication with undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(undefined, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0500
     * @tc.desc   test setDefaultApplication with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(9 as bundleManager.DefaultApplicationType, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0600
     * @tc.desc   test setDefaultApplication with null bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, null,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0700
     * @tc.desc   test setDefaultApplication with undefined bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, undefined,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0800
     * @tc.desc   test setDefaultApplication with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, DEFAULT_APP_EMPTY_VALUE,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_0900
     * @tc.desc   test setDefaultApplication with null abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          null, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1000
     * @tc.desc   test setDefaultApplication with undefined abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          undefined, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1100
     * @tc.desc   test setDefaultApplication with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_EMPTY_VALUE, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1200
     * @tc.desc   test setDefaultApplication with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, null);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1300
     * @tc.desc   test setDefaultApplication with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, undefined);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1400
     * @tc.desc   test setDefaultApplication with invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setDefaultApplication_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_APP_INVALID_ACCOUNT_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_setDefaultApplication_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDEFAULTAPPLICATION_JS_1500
     * @tc.desc   test setDefaultApplication with an app which is not the default application type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setDefaultApplication_1500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.setDefaultApplication(bundleManager.DefaultApplicationType.BROWSER, SELFHAPNAME,
          DEFAULT_APP_ABILITY_NAME, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0100
     * @tc.desc   test getDefaultApplicationBundleName without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0100", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getDefaultApplicationBundleName(bundleManager.DefaultApplicationType.BROWSER,
          DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200001);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0200
     * @tc.desc   test getDefaultApplicationBundleName with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bundleManager.getDefaultApplicationBundleName(bundleManager.DefaultApplicationType.BROWSER,
          DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200002);
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0300
     * @tc.desc   test getDefaultApplicationBundleName with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(null, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0400
     * @tc.desc   test getDefaultApplicationBundleName with undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(undefined, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0500
     * @tc.desc   test getDefaultApplicationBundleName with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(9 as bundleManager.DefaultApplicationType, DEFAULT_USER_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0600
     * @tc.desc   test getDefaultApplicationBundleName with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(bundleManager.DefaultApplicationType.BROWSER, null);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0700
     * @tc.desc   test getDefaultApplicationBundleName with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(bundleManager.DefaultApplicationType.BROWSER, undefined);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0800
     * @tc.desc   test getDefaultApplicationBundleName with invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDefaultApplicationBundleName_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getDefaultApplicationBundleName(bundleManager.DefaultApplicationType.BROWSER,
          DEFAULT_APP_INVALID_ACCOUNT_ID);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(9200012);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_0900
     * @tc.desc   test getDefaultApplicationBundleName with BROWSER type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_0900", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.BROWSER, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1000
     * @tc.desc   test getDefaultApplicationBundleName with IMAGE type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.IMAGE, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1100
     * @tc.desc   test getDefaultApplicationBundleName with AUDIO type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1100", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.AUDIO, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1200
     * @tc.desc   test getDefaultApplicationBundleName with VIDEO type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1200", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.VIDEO, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1300
     * @tc.desc   test getDefaultApplicationBundleName with PDF type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1300", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.PDF, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1400
     * @tc.desc   test getDefaultApplicationBundleName with WORD type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1400", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.WORD, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1500
     * @tc.desc   test getDefaultApplicationBundleName with EXCEL type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1500", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.EXCEL, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1600
     * @tc.desc   test getDefaultApplicationBundleName with PPT type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1600", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.PPT, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_getDefaultApplicationBundleName_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDEFAULTAPPLICATIONBUNDLENAME_JS_1700
     * @tc.desc   test getDefaultApplicationBundleName with EMAIL type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getDefaultApplicationBundleName_1700", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = bundleManager.getDefaultApplicationBundleName(
          bundleManager.DefaultApplicationType.EMAIL, DEFAULT_USER_ID);
        expect(typeof bundleName).assertEqual('string');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}
