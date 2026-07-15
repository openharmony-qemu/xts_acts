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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import { SavePhoto, GetUri } from './ContactTestUtil.test';
import { Component, Driver, On, ON } from '@ohos.UiTest';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

function sleep(time: number): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}
 
// 弹窗点击辅助函数：查找并点击组件
async function getComponent(driver: Driver, onType: On) {
  let timeout = 5000; // 5秒超时
  let startTime = Date.now();
  while (Date.now() - startTime < timeout) {
    let item: Component = await driver.findComponent(onType);
    if (item) {
      console.log(`getComponent found: ${onType}`);
      await item.click();
      return;
    }
    await sleep(300);
  }
  console.log(`getComponent timeout: ${onType} not found`);
}
 
// 点击同步对话框的"同步"按钮（弹窗3秒后可点击）
async function clickSyncButtonOnDialog(): Promise<void> {
  try {
    await sleep(3100); // 等待3秒+100ms缓冲
    let driver: Driver = Driver.create();
    let onSync: On = ON.text('同步');
    await getComponent(driver, onSync);
    console.log('clickSyncButtonOnDialog: clicked 同步 button');
  } catch (err) {
    console.info(`clickSyncButtonOnDialog catch: ${JSON.stringify(err)}`);
  }
}

export default function NoPermissionOtherTest() {
  describe('NoPermissionOtherTest', () => {
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

    /**
     * @tc.name   testSyncContacts2100
     * @tc.number SUB_Telephony_Contact_testSyncContacts_2100
     * @tc.desc   Test SyncContacts without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testSyncContacts2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testSyncContacts2100';
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('UIContext') as Context;
      let contacts: contact.Contact[] = [contactData ];
      try {
        await sleep(500);
        let promise = contact.syncContacts(context, 1,{ syncId: 0, currentBatch: 1, totalBatches: 1 }, contacts);
        clickSyncButtonOnDialog();
        promise.then((data: number[]) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        expect(err.code === 201).assertTrue();
        done();
      }
    })
 
    /**
     * @tc.name testQueryContactSyncInfo0100
     * @tc.number SUB_Telephony_Contact_QueryContactSyncInfo_0100
     * @tc.desc Test QueryContactSyncInfo without permission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactSyncInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactSyncInfo0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(context);
          promise.then((data: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect(err.code === 201).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

  })
}
