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

import { describe, beforeAll, afterAll, it, expect, Level } from "@ohos/hypium";
import { ENTINFO1, SELFWANT, SELFHAPNAME, DEFAULT_USER_ID, INVALID_USER_ID, appIdsInit,
  INVALID_WANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1 } from "../commom.test.ets";
import { Driver, ON } from '@kit.TestKit';

import accountManager from '@ohos.enterprise.accountManager';
import adminManager from '@ohos.enterprise.adminManager';
import osAccount from '@ohos.account.osAccount';

export default function accountManagerTest() {

  describe('accountManager_test', () => {

    let normalId1: number = 0;
    let normalId2: number = 0;
    let localId: number = 0;

    /**
     * @tc.name   test_createNormalOsAccount_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0100
     * @tc.desc   test createNormalOsAccount without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.createNormalOsAccount(SELFWANT, 'test_name');
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_createNormalOsAccount_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0200
     * @tc.desc   test createNormalOsAccount with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await accountManager.createNormalOsAccount(SELFWANT, 'test_name');
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
    })

    /**
     * @tc.name   test_createNormalOsAccount_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0300
     * @tc.desc   test createNormalOsAccount with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.createNormalOsAccount(null, 'test_name');
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_createNormalOsAccount_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0400
     * @tc.desc   test createNormalOsAccount with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.createNormalOsAccount(undefined, 'test_name');
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_createNormalOsAccount_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0500
     * @tc.desc   test createNormalOsAccount with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.createNormalOsAccount(INVALID_WANT, 'test_name');
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_createNormalOsAccount_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0600
     * @tc.desc   test createNormalOsAccount with null name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.createNormalOsAccount(SELFWANT, null);
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
    })

    /**
     * @tc.name   test_createNormalOsAccount_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0700
     * @tc.desc   test createNormalOsAccount with undefined name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.createNormalOsAccount(SELFWANT, undefined);
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
    })

    /**
     * @tc.name   test_createNormalOsAccount_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0800
     * @tc.desc   test createNormalOsAccount with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_createNormalOsAccount_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.createNormalOsAccount(SELFWANT, '');
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
    })

    /**
     * @tc.name   test_createNormalOsAccount_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_0900
     * @tc.desc   test createNormalOsAccount success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_createNormalOsAccount_0900", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "xts_create_normal_1";
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.createNormalOsAccount(SELFWANT, accountName);
        normalId1 = newAccount.localId;
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_createNormalOsAccount_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_CREATENORMALOSACCOUNT_JS_1000
     * @tc.desc   test createNormalOsAccount limit number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_createNormalOsAccount_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName2: string = "xts_create_normal_2";
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.createNormalOsAccount(SELFWANT, accountName2);
        normalId2 = newAccount.localId;
        expect(newAccount.localName == accountName2).assertTrue();
        let accountName3: string = "xts_create_normal_3";
        let newAccount3: osAccount.OsAccountInfo = await accountManager.createNormalOsAccount(SELFWANT, accountName3);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9201040).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0100
     * @tc.desc   test removeOsAccount without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0100", Level.LEVEL2, async (done: Function) => {
      await accountManager.removeOsAccount(SELFWANT, 101).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0200
     * @tc.desc   test removeOsAccount with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await accountManager.removeOsAccount(SELFWANT, 101);
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
    })

    /**
     * @tc.name   test_removeOsAccount_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0300
     * @tc.desc   test removeOsAccount with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.removeOsAccount(null, 101);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0400
     * @tc.desc   test removeOsAccount with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.removeOsAccount(undefined, 101);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0500
     * @tc.desc   test removeOsAccount with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.removeOsAccount(INVALID_WANT, 101);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0600
     * @tc.desc   test removeOsAccount with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, null);
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
    })

    /**
     * @tc.name   test_removeOsAccount_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0700
     * @tc.desc   test removeOsAccount with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, undefined);
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
    })

    /**
     * @tc.name   test_removeOsAccount_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0800
     * @tc.desc   test removeOsAccount with accountId 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await accountManager.removeOsAccount(SELFWANT, 0).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9201041).assertTrue();
        }
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_0900
     * @tc.desc   test removeOsAccount with accountId -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeOsAccount_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, -1);
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
    })

    /**
     * @tc.name   test_removeOsAccount_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_1000
     * @tc.desc   test removeOsAccount success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_removeOsAccount_1000", Level.LEVEL0, async (done: Function) => {
      if (normalId1 === 0) {
        done();
        return;
      }
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, normalId1);
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeOsAccount_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEOSACCOUNT_JS_1100
     * @tc.desc   test removeOsAccount success second account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_removeOsAccount_1100", Level.LEVEL0, async (done: Function) => {
      if (normalId2 === 0) {
        done();
        return;
      }
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, normalId2);
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0100
     * @tc.desc   test activateOsAccount without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.activateOsAccount(SELFWANT, 101);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0200
     * @tc.desc   test activateOsAccount with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      await accountManager.activateOsAccount(SELFWANT, 101).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0300
     * @tc.desc   test activateOsAccount with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.activateOsAccount(null, 100);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0400
     * @tc.desc   test activateOsAccount with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.activateOsAccount(undefined, 100);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0500
     * @tc.desc   test activateOsAccount with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await accountManager.activateOsAccount(INVALID_WANT, 100);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0600
     * @tc.desc   test activateOsAccount with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.activateOsAccount(SELFWANT, null);
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
    })

    /**
     * @tc.name   test_activateOsAccount_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0700
     * @tc.desc   test activateOsAccount with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.activateOsAccount(SELFWANT, undefined);
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
    })

    /**
     * @tc.name   test_activateOsAccount_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0800
     * @tc.desc   test activateOsAccount with accountId -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await accountManager.activateOsAccount(SELFWANT, -1).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200012).assertTrue();
        }
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_0900
     * @tc.desc   test activateOsAccount with accountId restricted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_activateOsAccount_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      try {
        await accountManager.activateOsAccount(SELFWANT, 100);
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        expect(newAccount.localName == accountName).assertTrue();

        await accountManager.activateOsAccount(SELFWANT, localId);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9201041).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_1000
     * @tc.desc   test activateOsAccount remove adminAccount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_activateOsAccount_1000", Level.LEVEL0, async (done: Function) => {
      if (localId === 0) {
        done();
        return;
      }
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.removeOsAccount(SELFWANT, localId);
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_activateOsAccount_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ACTIVATEOSACCOUNT_JS_1100
     * @tc.desc   test activateOsAccount success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_activateOsAccount_1100", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.activateOsAccount(SELFWANT, 100);
      } catch (error) {
        expect(error.code === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}