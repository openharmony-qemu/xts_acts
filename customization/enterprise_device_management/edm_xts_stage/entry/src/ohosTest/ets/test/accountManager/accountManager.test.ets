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
  INVALID_WANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1 } from "../commom.ets";
import { Driver, ON } from '@kit.TestKit';

import accountManager from '@ohos.enterprise.accountManager';
import adminManager from '@ohos.enterprise.adminManager';
import osAccount from '@ohos.account.osAccount';

export default function accountManagerTest() {

  describe('accountManager_test', () => {

    let localIds: Array<number> = [];

    beforeAll((done: Function) => {
      appIdsInit();
      done();
    })

    afterAll(async (done: Function) => {
      let authorizationManager: osAccount.AuthorizationManager = osAccount.getAuthorizationManager();
      let privilege: string = 'ohos.privilege.manage_local_accounts';
      let options: osAccount.AcquireAuthorizationOptions = {
        challenge: new Uint8Array([1, 2, 3]),
        isReuseNeeded: true,
        isInteractionAllowed: true,
      };
      try {
        setTimeout(async () => {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.text("确定"));
          if (allowed) {
            let point = await allowed.getBoundsCenter();
            await driver.click(point.x, point.y);
          }
        }, 2000);
        let result = await authorizationManager.acquireAuthorization(privilege, options);
        let rmOptions: osAccount.RemoveOsAccountOptions = {
          token: result.token
        }
        let osAccountManager = osAccount.getAccountManager();
        localIds.forEach((localId) => {
          osAccountManager.removeOsAccount(localId, rmOptions);
        })
      } catch (err) {
        console.error(`acquireAuthorization exception: code is ${err.code}, message is ${err.message}`);
      }

      console.info(' --- resetDomainAccountPolicy  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {};
      try {
        accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
      } catch (error) {
        console.info(' --- resetDomainAccountPolicy error 801 is expected, actually catch: ' + error.code);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      console.info(' --- resetDomainAccountPolicy  -------- END --------');
      done();
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0100
     * @tc.number disallowOsAccountAddition_test_0100
     * @tc.desc   disallowOsAccountAddition with inactive admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0100", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- disallowOsAccountAddition_test_0100  -------- START --------');
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        console.info(' --- disallowOsAccountAddition_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0100  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0200
     * @tc.number disallowOsAccountAddition_test_0200
     * @tc.desc   disallowOsAccountAddition with inactive admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0200", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- disallowOsAccountAddition_test_0200  -------- START --------');
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        console.info(' --- disallowOsAccountAddition_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0200 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0200  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0300
     * @tc.number disallowOsAccountAddition_test_0300
     * @tc.desc   disallowOsAccountAddition with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        console.info(' --- disallowOsAccountAddition_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0300 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0300  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0400
     * @tc.number disallowOsAccountAddition_test_0400
     * @tc.desc   disallowOsAccountAddition with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        console.info(' --- disallowOsAccountAddition_test_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0400 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0400  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0500
     * @tc.number disallowOsAccountAddition_test_0500
     * @tc.desc   disallowOsAccountAddition without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.disallowOsAccountAddition(null, true);
        console.info(' --- disallowOsAccountAddition_test_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0500  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0600
     * @tc.number disallowOsAccountAddition_test_0600
     * @tc.desc   disallowOsAccountAddition with super admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0600 error is unexpected, actually catch: ' + error.code);

        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0600  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0700
     * @tc.number disallowOsAccountAddition_test_0700
     * @tc.desc   disallowOsAccountAddition with super admin and with current accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, DEFAULT_USER_ID);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, DEFAULT_USER_ID);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0700 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0700  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0800
     * @tc.number disallowOsAccountAddition_test_0800
     * @tc.desc   disallowOsAccountAddition with super admin and with another accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- disallowOsAccountAddition_test_0800 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- disallowOsAccountAddition_test_0800 newAccount.localId: ' + localId);
        accountManager.disallowOsAccountAddition(SELFWANT, true, localId);
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, localId);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, localId);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false, localId);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, localId);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, localId);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0800 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        if (isMultiAccountEnabled) {
          accountManager.disallowOsAccountAddition(SELFWANT, false, localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0800  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0900
     * @tc.number disallowOsAccountAddition_test_0900
     * @tc.desc   disallowOsAccountAddition with super admin and with non-exist accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0900  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0900  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_1000
     * @tc.number disallowOsAccountAddition_test_1000
     * @tc.desc   repeat call disallowOsAccountAddition with super admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1000  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = accountManager.disallowOsAccountAddition(SELFWANT, true);
        expect(ret == null).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1000 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1000  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_1100
     * @tc.number disallowOsAccountAddition_test_1100
     * @tc.desc   repeat call disallowOsAccountAddition with super admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        expect(ret == null).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1100 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1100  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0100
     * @tc.number isOsAccountAdditionDisallowed_test_0100
     * @tc.desc   isOsAccountAdditionDisallowed with inactive admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0100", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- isOsAccountAdditionDisallowed_test_0100  -------- START --------');
        accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0100  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0200
     * @tc.number isOsAccountAdditionDisallowed_test_0200
     * @tc.desc   isOsAccountAdditionDisallowed with inactive admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0200", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- isOsAccountAdditionDisallowed_test_0200  -------- START --------');
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0200 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0200  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0300
     * @tc.number isOsAccountAdditionDisallowed_test_0300
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0300 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0300  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0400
     * @tc.number isOsAccountAdditionDisallowed_test_0400
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0400 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0400  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0500
     * @tc.number isOsAccountAdditionDisallowed_test_0500
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0500  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(INVALID_WANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0500 error 9200002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0500  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0600
     * @tc.number isOsAccountAdditionDisallowed_test_0600
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0600  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(INVALID_WANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_0600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0600 error 9200002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0600  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0100
     * @tc.number addOsAccountAsync_test_0100
     * @tc.desc   addOsAccountAsync with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0100", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- addOsAccountAsync_test_0100  -------- START --------');
        await accountManager.addOsAccountAsync(SELFWANT, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- addOsAccountAsync_test_0100  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0200
     * @tc.number addOsAccountAsync_test_0200
     * @tc.desc   addOsAccountAsync with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await accountManager.addOsAccountAsync(SELFWANT, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0200 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0200  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0300
     * @tc.number addOsAccountAsync_test_0300
     * @tc.desc   addOsAccountAsync without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        await accountManager.addOsAccountAsync(null, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0300 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0300  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0400
     * @tc.number addOsAccountAsync_test_0400
     * @tc.desc   addOsAccountAsync with super admin to create admin account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name2";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_0400 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_0400 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0400 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0400  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0500
     * @tc.number addOsAccountAsync_test_0500
     * @tc.desc   addOsAccountAsync with super admin to create normal account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name3";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_0500 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.NORMAL);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_0500 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0500 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0500  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0600
     * @tc.number addOsAccountAsync_test_0600
     * @tc.desc   addOsAccountAsync with super admin to create guest account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name4";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_0600 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.GUEST);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_0600 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0600 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0600  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0700
     * @tc.number addOsAccountAsync_test_0700
     * @tc.desc   addOsAccountAsync with invalid account name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "err_name";
      for (let i = 0; i < 1024; i++) {
        accountName = accountName.concat('a');
      }
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_0700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0700 error 9201003 is expected, actually catch: ' + error.code);
        expect(error.code == 9201003).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0700  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_0800
     * @tc.number addOsAccountAsync_test_0800
     * @tc.desc   addOsAccountAsync with invalid account type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let wrongType = 99999;
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT, accountName, wrongType);
        console.info(' --- addOsAccountAsync_test_0800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_0800  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0100
     * @tc.number setDomainAccountPolicy_test_0100
     * @tc.desc   setDomainAccountPolicy with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0100", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- setDomainAccountPolicy_test_0100  -------- START --------');
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0100 error 9200001 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0100  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0200
     * @tc.number setDomainAccountPolicy_test_0200
     * @tc.desc   setDomainAccountPolicy with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0200", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- setDomainAccountPolicy_test_0200  -------- START --------');
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0200 error 9200002 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0200  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0300
     * @tc.number setDomainAccountPolicy_test_0300
     * @tc.desc   setDomainAccountPolicy without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.setDomainAccountPolicy(null, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0300 error 401 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0300  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0400
     * @tc.number setDomainAccountPolicy_test_0400
     * @tc.desc   setDomainAccountPolicy with super admin to set empty domain account policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {};
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
        let getPolicy: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy.authenticationValidityPeriod == -1).assertTrue();
        expect(getPolicy.passwordValidityPeriod == -1).assertTrue();
        expect(getPolicy.passwordExpirationNotification == 0).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0400 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0400  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0500
     * @tc.number setDomainAccountPolicy_test_0500
     * @tc.desc   setDomainAccountPolicy with error domain admin info to set domain account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let errorDomainAccount: osAccount.DomainAccountInfo = {
        domain: 'XXX',
        accountName: 'XXX',
        accountId: 'XXX',
        serverConfigId: 'XXX',
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, errorDomainAccount, DOMAIN_ACCOUNT_POLICY1);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0500 error 9200007 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200007).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0500  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0600
     * @tc.number setDomainAccountPolicy_test_0600
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy by decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: 6.9,
        passwordValidityPeriod: -0.1,
        passwordExpirationNotification: 3.3,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        let policy2: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(policy2.authenticationValidityPeriod == 6).assertTrue();
        expect(policy2.passwordValidityPeriod == 0).assertTrue();
        expect(policy2.passwordExpirationNotification == 3).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0600 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0600  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0700
     * @tc.number setDomainAccountPolicy_test_0700
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy below lower limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: -5,
        passwordValidityPeriod: -5,
        passwordExpirationNotification: -5,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0700 error 401 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0700  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0800
     * @tc.number setDomainAccountPolicy_test_0800
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy exceeds the int32_t validity range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let int32_t_min: number = -2147483648;
      let int32_t_max: number = 2147483647;
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: int32_t_min - 1,
        passwordValidityPeriod: int32_t_min - 1,
        passwordExpirationNotification: int32_t_min - 1,
      };
      let policy2: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: int32_t_max + 1,
        passwordValidityPeriod: int32_t_max + 1,
        passwordExpirationNotification: int32_t_max + 1,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        let getPolicy1: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy1.authenticationValidityPeriod == int32_t_max).assertTrue();
        expect(getPolicy1.passwordValidityPeriod == int32_t_max).assertTrue();
        expect(getPolicy1.passwordExpirationNotification == int32_t_max).assertTrue();
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy2);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0800 error 401 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0800  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_0900
     * @tc.number setDomainAccountPolicy_test_0900
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_0900  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {
        passwordValidityPeriod: 300,
        passwordExpirationNotification: 360,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
        let getPolicy: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy.authenticationValidityPeriod == - 1).assertTrue();
        expect(getPolicy.passwordValidityPeriod == 300).assertTrue();
        expect(getPolicy.passwordExpirationNotification == 360).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_0900 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_0900  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_0100
     * @tc.number getDomainAccountPolicy_test_0100
     * @tc.desc   getDomainAccountPolicy with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0100", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- getDomainAccountPolicy_test_0100  -------- START --------');
        await accountManager.getDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0100 error 9200001 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0100  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_0200
     * @tc.number getDomainAccountPolicy_test_0200
     * @tc.desc   getDomainAccountPolicy with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0200", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- getDomainAccountPolicy_test_0200  -------- START --------');
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await accountManager.getDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0200 error 9200002 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0200  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_0300
     * @tc.number getDomainAccountPolicy_test_0300
     * @tc.desc   getDomainAccountPolicy without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.getDomainAccountPolicy(null, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0300 error 401 and 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0300  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_1200
     * @tc.number disallowOsAccountAddition_test_1200
     * @tc.desc   disallowOsAccountAddition with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1200  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(null, true);
        console.info(' --- disallowOsAccountAddition_test_1200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1200 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1200  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1300
     * @tc.number disallowOsAccountAddition_test_1300
     * @tc.desc   disallowOsAccountAddition with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1300  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(undefined, true);
        console.info(' --- disallowOsAccountAddition_test_1300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1300 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1300  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1400
     * @tc.number disallowOsAccountAddition_test_1400
     * @tc.desc   disallowOsAccountAddition with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1400  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, null);
        console.info(' --- disallowOsAccountAddition_test_1400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1400 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1400  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1500
     * @tc.number disallowOsAccountAddition_test_1500
     * @tc.desc   disallowOsAccountAddition with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1500  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, undefined);
        console.info(' --- disallowOsAccountAddition_test_1500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1500  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0700
     * @tc.number isOsAccountAdditionDisallowed_test_0700
     * @tc.desc   isOsAccountAdditionDisallowed with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0700  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(undefined);
        console.info(' --- isOsAccountAdditionDisallowed_test_0700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0700 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0700  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0800
     * @tc.number isOsAccountAdditionDisallowed_test_0800
     * @tc.desc   isOsAccountAdditionDisallowed with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0800  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, null);
        console.info(' --- isOsAccountAdditionDisallowed_test_0800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0800  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_0900
     * @tc.number isOsAccountAdditionDisallowed_test_0900
     * @tc.desc   isOsAccountAdditionDisallowed with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_0900  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, undefined);
        console.info(' --- isOsAccountAdditionDisallowed_test_0900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_0900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_0900  -------- END --------');
    })


    /**
     * @tc.name   addOsAccountAsync_test_0900
     * @tc.number addOsAccountAsync_test_0900
     * @tc.desc   addOsAccountAsync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_0900  -------- START --------');
      try {
        accountManager.addOsAccountAsync(null, 'accountName', osAccount.OsAccountType.GUEST);
        console.info(' --- addOsAccountAsync_test_0900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_0900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addOsAccountAsync_test_0900  -------- END --------');
    })


    /**
     * @tc.name   addOsAccountAsync_test_1000
     * @tc.number addOsAccountAsync_test_1000
     * @tc.desc   addOsAccountAsync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_1000  -------- START --------');
      try {
        accountManager.addOsAccountAsync(undefined, 'accountName', osAccount.OsAccountType.GUEST);
        console.info(' --- addOsAccountAsync_test_1000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_1000 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addOsAccountAsync_test_1000  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1600
     * @tc.number disallowOsAccountAddition_test_1600
     * @tc.desc   disallowOsAccountAddition with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1600  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(null, true);
        console.info(' --- disallowOsAccountAddition_test_1600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1600 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1600  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1700
     * @tc.number disallowOsAccountAddition_test_1700
     * @tc.desc   disallowOsAccountAddition with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1700  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(undefined, true);
        console.info(' --- disallowOsAccountAddition_test_1700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1700 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1700  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1800
     * @tc.number disallowOsAccountAddition_test_1800
     * @tc.desc   disallowOsAccountAddition with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1800  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, null);
        console.info(' --- disallowOsAccountAddition_test_1800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1800  -------- END --------');
    })


    /**
     * @tc.name   disallowOsAccountAddition_test_1900
     * @tc.number disallowOsAccountAddition_test_1900
     * @tc.desc   disallowOsAccountAddition with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_1900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_1900  -------- START --------');
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, undefined);
        console.info(' --- disallowOsAccountAddition_test_1900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_1900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_1900  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_1000
     * @tc.number isOsAccountAdditionDisallowed_test_1000
     * @tc.desc   isOsAccountAdditionDisallowed with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_1000  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(undefined);
        console.info(' --- isOsAccountAdditionDisallowed_test_1000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_1000 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_1000  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_1100
     * @tc.number isOsAccountAdditionDisallowed_test_1100
     * @tc.desc   isOsAccountAdditionDisallowed with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_1100  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, null);
        console.info(' --- isOsAccountAdditionDisallowed_test_1100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_1100 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_1100  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_1200
     * @tc.number isOsAccountAdditionDisallowed_test_1200
     * @tc.desc   isOsAccountAdditionDisallowed with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_1200  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, undefined);
        console.info(' --- isOsAccountAdditionDisallowed_test_1200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_1200 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_1200  -------- END --------');
    })
    
    /**
     * @tc.name   addOsAccountAsync_test_1100
     * @tc.number addOsAccountAsync_test_1100
     * @tc.desc   addOsAccountAsync with "" parameter accountName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_1100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.addOsAccountAsync(SELFWANT, '', osAccount.OsAccountType.GUEST);
        console.info(' --- addOsAccountAsync_test_1100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_1100 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_1100  -------- END --------');
    })


    /**
     * @tc.name   addOsAccountAsync_test_1200
     * @tc.number addOsAccountAsync_test_1200
     * @tc.desc   addOsAccountAsync with null parameter accountName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_1200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.addOsAccountAsync(SELFWANT, null, osAccount.OsAccountType.GUEST);
        console.info(' --- addOsAccountAsync_test_1200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_1200 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_1200  -------- END --------');
    })


    /**
     * @tc.name   addOsAccountAsync_test_1300
     * @tc.number addOsAccountAsync_test_1300
     * @tc.desc   addOsAccountAsync with undefined parameter accountName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_1300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.addOsAccountAsync(SELFWANT, undefined, osAccount.OsAccountType.GUEST);
        console.info(' --- addOsAccountAsync_test_1300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_1300 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_1300  -------- END --------');
    })


    /**
     * @tc.name   setDomainAccountPolicy_test_1000
     * @tc.number setDomainAccountPolicy_test_1000
     * @tc.desc   setDomainAccountPolicy with undefined admin to set domain account policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_1000  -------- START --------');
      let policy: accountManager.DomainAccountPolicy = {
        passwordValidityPeriod: 300,
        passwordExpirationNotification: 360,
      };
      try {
        await accountManager.setDomainAccountPolicy(undefined, DOMAIN_ACCOUNT_INFO1, policy);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_1000 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_1000  -------- END --------');
    })


    /**
     * @tc.name   setDomainAccountPolicy_test_1100
     * @tc.number setDomainAccountPolicy_test_1100
     * @tc.desc   setDomainAccountPolicy with null domainAccountInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_1100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {
        passwordValidityPeriod: 300,
        passwordExpirationNotification: 360,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, null, policy);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_1100 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_1100  -------- END --------');
    })


    /**
     * @tc.name   setDomainAccountPolicy_test_1200
     * @tc.number setDomainAccountPolicy_test_1200
     * @tc.desc   setDomainAccountPolicy with undefined domainAccountInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_1200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {
        passwordValidityPeriod: 300,
        passwordExpirationNotification: 360,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, undefined, policy);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_1200 error 801 or 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_1200  -------- END --------');
    })


    /**
     * @tc.name   setDomainAccountPolicy_test_1300
     * @tc.number setDomainAccountPolicy_test_1300
     * @tc.desc   setDomainAccountPolicy with null policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_1300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, null);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_1300 error 801 or 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_1300  -------- END --------');
    })


    /**
     * @tc.name   setDomainAccountPolicy_test_1400
     * @tc.number setDomainAccountPolicy_test_1400
     * @tc.desc   setDomainAccountPolicy with undefined policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_1400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_1400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, undefined);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_1400 error 801 or 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_1400  -------- END --------');
    })


    /**
     * @tc.name   getDomainAccountPolicy_test_0400
     * @tc.number getDomainAccountPolicy_test_0400
     * @tc.desc   getDomainAccountPolicy with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.getDomainAccountPolicy(undefined, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0400 error 401 or 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0400  -------- END --------');
    })


    /**
     * @tc.name   getDomainAccountPolicy_test_0500
     * @tc.number getDomainAccountPolicy_test_0500
     * @tc.desc   getDomainAccountPolicy with null domainAccountInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.getDomainAccountPolicy(SELFWANT, null);
        console.info(' --- getDomainAccountPolicy_test_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0500 error 401 or 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0500  -------- END --------');
    })


    /**
     * @tc.name   getDomainAccountPolicy_test_0600
     * @tc.number getDomainAccountPolicy_test_0600
     * @tc.desc   getDomainAccountPolicy with undefined domainAccountInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.getDomainAccountPolicy(SELFWANT, undefined);
        console.info(' --- getDomainAccountPolicy_test_0600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_0600 error 401 or 801 is expected, actually catch: '
          + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_0600  -------- END --------');
    })
  })
}
