/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, On, ON } from '@ohos.UiTest';
import { deviceInfo } from '@kit.BasicServicesKit';
import { SavePhoto, GetUri } from './ContactTestUtil.test';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, ms);
    });
}

async function getComponent(driver: Driver, onType: On, maxRetries: number = 3) : Promise<boolean> {
    let item:Component | null  = null;
    let retryCount = 0;
    while (retryCount < maxRetries) {
        item = await driver.findComponent(onType);
        if (item) {
            console.log(`get component success, retryCount=${retryCount}`);
            await item.click();
            return true;
        }
        retryCount++;
        console.log(`get component failed, retryCount=${retryCount}`);
        await delay(1000);
    }
    console.log(`get component failed, retryCount=${retryCount}`);
    return false;
}

export default function ImportContactsViaUITest() {
  describe('ImportContactsViaUITest', () => {

    let fileName = 'SaveToExistingContactViaUITest.jpg';
    SavePhoto(fileName);
    let uri = GetUri(fileName);

    let contactDataNull: contact.Contact = {
    };
    let contactData: contact.Contact = {
      id: 0,
      key: "0",
      contactAttributes: {
        attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
        contact.Attribute.ATTR_GROUP_MEMBERSHIP,
        contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
        contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
        contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
        contact.Attribute.ATTR_RELATION,
        contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
      },
      emails: [{
        email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
      }],
      events: [{
        eventDate: "event", labelName: "自定义event", labelId: 2
      }],
      groups: [{
        groupId: 1, title: "群组"
      }],
      imAddresses: [{
        imAddress: "imAddress", labelName: "自定义", labelId: 3
      }],
      phoneNumbers: [{
        phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
      }],
      portrait: {
        uri: uri
      },
      postalAddresses: [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: 5
      }],
      relations: [{
        relationName: "relationName", labelName: "自定义relationName", labelId: 6
      }],
      sipAddresses: [{
        sipAddress: "sipAddress", labelName: "自定义sipAddress", labelId: 6
      }],
      websites: [{
        website: "website"
      }],
      name: {
        familyName: "familyName",
        familyNamePhonetic: "familyNamePhonetic",
        fullName: "奥迪",
        givenName: "givenName",
        givenNamePhonetic: "givenNamePhonetic",
        middleName: "middleName",
        middleNamePhonetic: "middleNamePhonetic",
        namePrefix: "namePrefix",
        nameSuffix: "nameSuffix"
      },
      nickName: {
        nickName: "nickName"
      },
      note: {
        noteContent: "note"
      },
      organization: {
        name: "TT", title: "开发"
      }
    };

    let contactDataWithDash: contact.Contact = {
        name: {fullName : "中划线测试"},
        phoneNumbers: [{phoneNumbers: "029-12345678"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    }

    let contactDataWitSpace: contact.Contact = {
        name: {fullName : "空格测试"},
        phoneNumbers: [{phoneNumbers: "138 0000 0000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    }

    let contactDataWitOverlong: contact.Contact = {
        name: {fullName : "超长号码测试"},
        phoneNumbers: [{phoneNumbers: "1380000000013800000000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    }

    let contactDataWitOverlong: contact.Contact = {
        name: {fullName : "国家码测试"},
        phoneNumbers: [{phoneNumbers: "+8613800000000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    }

    beforeAll(async (done: Function) => {
      console.info("beforeAll case");
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contactList: contact.Contact[] = [];
        try {
          contactList = await contact.queryContactsByPhoneNumber(context,"13800000000@email.com");
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        let contactEmails: contact.Contact[] = [];
        try {
          contactList = await contact.queryContactsByEmail(context,"13800000000");
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        for (let email of contactEmails) {
            contactList.push(email)
        }
        try {
          if (contactList.length > 0) {
            contactList.forEach(async (item: contact.Contact) => {
              if (item.key) {
                await contact.deleteContact(context, item.key);
                console.info(`afterEach deleteContact success->${item.key}`);
              }
            })
          }
          done();
        } catch (deleteErr) {
          console.info(`afterEach deleteContact catch err: ${JSON.stringify(deleteErr)}`);
          done();
        }
      } catch (error) {
        console.info(`afterEach catch error: ${JSON.stringify(error)}`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyContactImportContactViaUI0100
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0100
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [conactData];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.text('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[])) => {
            console.log(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.log(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })



    /**
     * @tc.name   testTelephonyContactImportContactViaUI0200
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0200
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [conactData];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.text('picker_cancel_btn');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[])) => {
            console.log(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            if (err.code === 16700103) {
                console.log(`${caseName} importContactsViaUI user cancel: errcode->${JSON.stringify(err.code)}`);
                expect(err.code).assertEqual(16700103);
                done();
            } else {
                console.log(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.name   testTelephonyContactImportContactViaUI0300
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0300
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let EmptyContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(context, EmptyContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code == 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.name   testTelephonyContactImportContactViaUI0400
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0400
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0400";
      console.info(`${caseName} test start `);
      try {
        let EmptyContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(undefined, EmptyContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code == 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.name   testTelephonyContactImportContactViaUI0500
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0500
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0500";
      console.info(`${caseName} test start `);
      try {
        let EmptyContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(null, EmptyContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code == 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactImportContactViaUI0600
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0600
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0600";
      console.info(`${caseName} test start `);
      try {
        const result = await contact.importContactsViaUI(null, undefined);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code == 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactImportContactViaUI0700
     * @tc.number SUB_Telephony_Contact_ImportContactViaUI_0700
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactViaUI0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactViaUI0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        const result = await contact.importContactsViaUI(context, null);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code == 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end `);
    })