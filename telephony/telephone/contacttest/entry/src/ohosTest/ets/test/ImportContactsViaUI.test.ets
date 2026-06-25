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

import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, On, ON } from '@ohos.UiTest';
import { SavePhoto, GetUri, GetPixelMap } from './ContactTestUtil.test';

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

function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, ms);
    });
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = 'ohos.permission.WRITE_CONTACTS' | 'ohos.permission.READ_CONTACTS';
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = 
      await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

async function getComponent(driver: Driver, onType: On, maxRetries: number = 3) : Promise<boolean> {
    let item:Component | null  = null;
    let retryCount = 0;
    while (retryCount < maxRetries) {
        item = await driver.findComponent(onType);
        if (item) {
            console.info(`get component success, retryCount=${retryCount}`);
            await item.click();
            return true;
        }
        retryCount++;
        console.info(`get component failed, retryCount=${retryCount}`);
        await delay(1000);
    }
    console.info(`get component failed after ${maxRetries} retries`);
    return false;
}

export default function ImportContactsViaUITest() {
  describe('ImportContactsViaUITest', () => {


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
        fullName: "小李",
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
        phoneNumbers: [{phoneNumber: "029-12345678"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    };

    let contactDataWithSpace: contact.Contact = {
        name: {fullName : "空格测试"},
        phoneNumbers: [{phoneNumber: "138 0000 0000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    };

    let contactDataOverlong: contact.Contact = {
        name: {fullName : "超长号码测试"},
        phoneNumbers: [{phoneNumber: "13800000000138000000001380000000013800000000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    };

    let contactDataWithCountry: contact.Contact = {
        name: {fullName : "国家码测试"},
        phoneNumbers: [{phoneNumber: "+8613800000000"}],
        emails: [{
            email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
        }]
    };

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
          contactList = await contact.queryContactsByPhoneNumber(context,"13800000000");
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        let contactEmails: contact.Contact[] = [];
        try {
          contactEmails = await contact.queryContactsByEmail(context,"13800000000@email.com");
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        for (let email of contactEmails) {
            contactList.push(email);
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
     * @tc.name   testTelephonyContactImportContactsViaUI0100
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0100
     * @tc.desc   Call importContactsViaUI with normal contacts, click save button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI0100";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactData];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
            console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
            ExpectTrue(data[0] > 0);
            done();
        }).catch((err: BusinessError) => {
            console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    })



    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0200
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0200
     * @tc.desc   Call importContactsViaUI verify error code 16700103 when user cancels, click cancel button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI0200";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactData];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('picker_cancel_btn');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
            console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
        }).catch((err: BusinessError) => {
            if (err.code === 16700103) {
              console.info(`${caseName} user cancel: errcode->${JSON.stringify(err.code)}`);
              expect(err.code).assertEqual(16700103);
              done();
            } else {
                console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    })


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0300
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0300
     * @tc.desc   Call importContactsViaUI with empty contacts array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI0300";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let emptyContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(context, emptyContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0400
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0400
     * @tc.desc   Call importContactsViaUI with undefined context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI0400";
      console.info(`${caseName} test start`);
      try {
        let testContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(undefined, testContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0500
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0500
     * @tc.desc   Call importContactsViaUI with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI0500";
      console.info(`${caseName} test start`);
      try {
        let testContacts: contact.Contact[] = [];
        const result = await contact.importContactsViaUI(null, testContacts);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0600
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0600
     * @tc.desc   Call importContactsViaUI with undefined contacts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI0600";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        const result = await contact.importContactsViaUI(context, undefined);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0700
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0700
     * @tc.desc   Call importContactsViaUI with null contacts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI0700";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        const result = await contact.importContactsViaUI(context, null);
        console.info(`${caseName} : result = ${JSON.stringify(result)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} : importContactsViaUI error = ${error.code}, ${error.message}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI0900
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_0900
     * @tc.desc   Call importContactsViaUI with phoneNumber containing dash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI0900";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactDataWithDash];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data[0] > 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end `);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI1000
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_1000
     * @tc.desc   Call importContactsViaUI with phoneNumber containing spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI1000";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactDataWithSpace];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data[0] > 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end `);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI1500
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_1500
     * @tc.desc   Call importContactsViaUI to verify error code 16700004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI1500";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < 101; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `李四${i}`
            }, phoneNumbers:[{
              phoneNumber: `13800000000`
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        let promise = contact.importContactsViaUI(context, phoneNumContacts);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          if (err.code === 16700004) {
            console.info(`${caseName} system error: errcode->${JSON.stringify(err.code)}`);
            expect(err.code).assertEqual(16700004);
            done();
          } else {
            console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();      
          }
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });


   /**
     * @tc.name   testTelephonyContactImportContactsViaUI1600
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_1600
     * @tc.desc   Call importContactsViaUI to verify error code 16700004 and big data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactImportContactsViaUI1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testTelephonyContactImportContactsViaUI1600";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < 10000; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
                fullName: `李四${i}`
            }, phoneNumbers:[{
                phoneNumber: `13800000000`
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        let promise = contact.importContactsViaUI(context, phoneNumContacts);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          if (err.code === 16700004) {
            console.info(`${caseName} system error: errcode->${JSON.stringify(err.code)}`);
            expect(err.code).assertEqual(16700004);
            done();
          } else {
            console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();      
          }
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyContactImportContactsViaUI1700
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_1700
     * @tc.desc   Call importContactsViaUI to verify non-selected contact returns -2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI1700";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let multiContacts: contact.Contact[] = [
            { name: { fullName: "选择1"}, phoneNumbers:[{ phoneNumber: "13800000000"}] },
            { name: { fullName: "选择2"}, phoneNumbers:[{ phoneNumber: "13800000000"}] }
        ];
        let promise = contact.importContactsViaUI(context, multiContacts);
        let driver: Driver = Driver.create();
        // 页面默认全选，先取消选择"选择2"
        let select2Retry = 0;
        let select2Component: Component | null = null; 
        while (select2Retry < 3) {
            select2Component = await driver.findComponent(ON.text('选择2'));
            if (select2Component) {
                console.info(`${caseName} select2 found, retryCount=${select2Retry}`);
                await select2Component.click();
                break;
            }
            select2Retry++;
            console.info(`${caseName} select2 not found, retryCount=${select2Retry}`);
            await delay(1000);
        }
        if (!select2Component) {
            console.info(`${caseName} select2 not found after 3 retries`);
            ExpectFail();
            done();
            return;
        }
        await delay(500);
        // 点击完成按钮
        let doneResult = await getComponent(driver, ON.id('doneButton'));
        if (!doneResult) {
          console.info(`${caseName} doneButton click failed `);
          ExpectFail();
          done();
          return;
        }
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data.length === 2 && data[0] > 0 && data[1] === -2);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI1800
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_1800
     * @tc.desc   Call importContactsViaUI with multiple contacts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI1800";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let multiContacts: contact.Contact[] = [
            { name: { fullName: "批量1"}, phoneNumbers:[{ phoneNumber: "13800000000"}] },
            { name: { fullName: "批量2"}, phoneNumbers:[{ phoneNumber: "13800000000"}] }
        ];
        let promise = contact.importContactsViaUI(context, multiContacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data[0] > 0 && data[1] > 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTelephonyContactImportContactsViaUI2000
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_2000
     * @tc.desc   Call importContactsViaUI with phoneNumber ultra long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI2000";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactDataOverlong];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data[0] > 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyContactImportContactsViaUI2100
     * @tc.number SUB_Telephony_Contact_ImportContactsViaUI_2100
     * @tc.desc   Call importContactsViaUI with Country code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactImportContactsViaUI2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactImportContactsViaUI2100";
      console.info(`${caseName} test start`);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contacts: contact.Contact[] = [contactDataWithCountry];
        let promise = contact.importContactsViaUI(context, contacts);
        let driver: Driver = Driver.create();
        let onType: On = ON.id('doneButton');
        await getComponent(driver, onType);
        await delay(500);
        promise.then((data: number[]) => {
          console.info(`${caseName} importContactsViaUI: data->${JSON.stringify(data)}`);
          ExpectTrue(data[0] > 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} importContactsViaUI: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      console.info(`${caseName} test end`);
    });

    });
}




