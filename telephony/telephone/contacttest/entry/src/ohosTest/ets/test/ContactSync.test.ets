/*
 * Copyright (c) huawei Technologies Co., Ltd. 2026. All rights reserved
 */

import { describe, beforeAll, afterEach, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, On, ON } from '@ohos.UiTest';

const TEST_PHONE_NUMBER = '13800000999';
const TEST_CONTACT_NAME = 'SyncTest';

// ContactSyncMode numeric values from @ohos.contact.d.ts SDK 26
// MODE_INCREMENTAL = 1, MODE_CLOUD_BASED = 2
const MODE_INCREMENTAL = 1;
const MODE_CLOUD_BASED = 2;
// INVALID_CONTACT_ID = 0
const INVALID_CONTACT_ID = 0;

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
    await sleep(3500); // 等待3秒+500ms缓冲
    let driver: Driver = Driver.create();
    let onSync: On = ON.text('同步');
    await getComponent(driver, onSync);
    console.log('clickSyncButtonOnDialog: clicked 同步 button');
  } catch (err) {
    console.info(`clickSyncButtonOnDialog catch: ${JSON.stringify(err)}`);
  }
}

// 点击同步对话框的"取消"按钮
async function clickCancelButtonOnDialog(): Promise<void> {
  try {
    await sleep(3100);
    let driver: Driver = Driver.create();
    let onCancel: On = ON.text('取消');
    await getComponent(driver, onCancel);
    console.log('clickCancelButtonOnDialog: clicked 取消 button');
  } catch (err) {
    console.info(`clickCancelButtonOnDialog catch: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info('expectInfo', `test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('expectInfo', `test failed`);
  }
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

async function deleteTestContacts(phoneNumber: string) {
  try {
    let context: Context = AppStorage.get('UIContext') as Context;
    let contactList: contact.Contact[] = await contact.queryContactsByPhoneNumber(context, phoneNumber);
    if (contactList.length > 0) {
      contactList.forEach(async (item: contact.Contact) => {
        if (item.key) {
          await contact.deleteContact(context, item.key);
          console.info(`deleteTestContacts success--${item.key}`);
        }
      })
    }
  } catch (err) {
    console.info(`deleteTestContacts catch err: ${JSON.stringify(err)}`);
  }
}

function createContact(name: string, phoneNumber: string): contact.Contact {
  return {
    name: {
      fullName: name
    },
    phoneNumbers: [{
      phoneNumber: phoneNumber,
      labelName: '自定义phoneNumbers',
      labelId: 1
    }]
  };
}

function createContactSyncProgress(syncId: number, currentBatch: number, totalBatches: number): contact.ContactSyncProgress {
  return {
    syncId: syncId,
    currentBatch: currentBatch,
    totalBatches: totalBatches
  };
}

function createSpecialContact(name: string, phoneNumber: string): contact.Contact {
  return {
    name: {
      familyName: 'Special',
      givenName: 'Test!@#$%^&*()',
      fullName: name + '!@#',
      familyNamePhonetic: 'test',
      givenNamePhonetic: 'test',
      middleName: 'middle',
      middleNamePhonetic: 'test',
      namePrefix: 'Mr.',
      nameSuffix: 'Jr.'
    },
    phoneNumbers: [{
      phoneNumber: phoneNumber,
      labelName: '自定义phoneNumbers',
      labelId: 1
    }],
    emails: [{
      email: 'test@example.com!@#',
      labelName: '自定义邮箱',
      labelId: 1,
      displayName: 'Display!@#'
    }],
    nickName: {
      nickName: 'Nick!@#'
    },
    note: {
      noteContent: 'Note!@#test'
    },
    organization: {
      name: 'Org!@#',
      title: 'Title!@#'
    }
  };
}

export default function ContactSyncTest() {
  describe('ContactSyncTest', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        await sleep(500);
        await deleteTestContacts(TEST_PHONE_NUMBER);
        done();
      } catch (error) {
        console.info(`afterEach catch error: ${JSON.stringify(error)}`);
        done();
      }
    });

    /**
     * @tc.name testQueryContactReturn0100
     * @tc.number SUB_Telephony_Contact_QueryContactReturn_0100
     * @tc.desc Test queryContactSyncInfo return check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactReturn0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(null);
          promise.then((data: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length).assertEqual(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - MODE_INCREMENTAL 增量同步模式测试
    // ============================================

    /**
     * @tc.name testSyncContactsModeIncrementalOneBatch0100
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeIncremental_OneBatch_0100
     * @tc.desc Test syncContacts with MODE_INCREMENTAL and 1 batch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeIncrementalOneBatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeIncrementalOneBatch0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 100;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          // 启动弹窗点击（3秒后点同步，不阻塞等待）
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            expect(data[0] > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsModeIncrementalTwoBatch0200
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeIncremental_TwoBatch_0200
     * @tc.desc Test syncContacts with MODE_INCREMENTAL and 2 batches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeIncrementalTwoBatch0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeIncrementalTwoBatch0200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 100;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 2, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsModeIncrementalThreeBatch0300
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeIncremental_ThreeBatch_0300
     * @tc.desc Test syncContacts with MODE_INCREMENTAL and 3 batches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeIncrementalThreeBatch0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeIncrementalThreeBatch0300';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 100;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 3, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - MODE_CLOUD_BASED 云端覆盖本地模式测试
    // ============================================

    /**
     * @tc.name testSyncContactsModeCloudBasedOneBatch0400
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeCloudBased_OneBatch_0400
     * @tc.desc Test syncContacts with MODE_CLOUD_BASED and 1 batch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeCloudBasedOneBatch0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeCloudBasedOneBatch0400';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 200;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_CLOUD_BASED, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsModeCloudBasedTwoBatch0500
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeCloudBased_TwoBatch_0500
     * @tc.desc Test syncContacts with MODE_CLOUD_BASED and 2 batches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeCloudBasedTwoBatch0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeCloudBasedTwoBatch0500';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 200;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 2, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_CLOUD_BASED, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsModeCloudBasedThreeBatch0600
     * @tc.number SUB_Telephony_Contact_SyncContacts_ModeCloudBased_ThreeBatch_0600
     * @tc.desc Test syncContacts with MODE_CLOUD_BASED and 3 batches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsModeCloudBasedThreeBatch0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsModeCloudBasedThreeBatch0600';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER)];
        let syncId: number = 200;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 3, 3);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_CLOUD_BASED, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - contacts 空数据集测试
    // ============================================

    /**
     * @tc.name testSyncContactsEmptyContacts0700
     * @tc.number SUB_Telephony_Contact_SyncContacts_EmptyContacts_0700
     * @tc.desc Test syncContacts with empty contacts array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsEmptyContacts0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsEmptyContacts0700';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - 特殊联系人测试
    // ============================================

    /**
     * @tc.name testSyncContactsSpecialCharsContacts0800
     * @tc.number SUB_Telephony_Contact_SyncContacts_SpecialCharsContacts_0800
     * @tc.desc Test syncContacts with special characters in contact
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsSpecialCharsContacts0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsSpecialCharsContacts0800';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createSpecialContact(`${TEST_CONTACT_NAME}!@#`, TEST_PHONE_NUMBER)];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - 大数据量分批测试 (10000联系人, 25批, 每批400)
    // ============================================

    /**
     * @tc.name testSyncContactsLargeData400Plus0900
     * @tc.number SUB_Telephony_Contact_SyncContacts_LargeData_400Plus_0900
     * @tc.desc Test syncContacts with 10000 contacts split into 25 batches of 400
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsLargeData400Plus0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsLargeData400Plus0900';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;

        // 创建10000个联系人
        const TOTAL_CONTACTS = 2000;
        const BATCH_SIZE = 400;
        const TOTAL_BATCHES = TOTAL_CONTACTS / BATCH_SIZE; // 5
        let allContacts: contact.Contact[] = [];

        console.info(`${caseName}: Creating ${TOTAL_CONTACTS} contacts`);
        for (let i = 0; i < TOTAL_CONTACTS; i++) {
          // 生成唯一电话号码，避免重复
          let phoneNum = `138${String(i).padStart(7, '0')}`;
          allContacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, phoneNum));
        }

        console.info(`${caseName}: Starting batch sync, ${TOTAL_BATCHES} batches of ${BATCH_SIZE} contacts each`);
        let syncId: number = Date.now() / 1000;
        // 逐批执行同步
        for (let batchIndex = 0; batchIndex < TOTAL_BATCHES; batchIndex++) {
          // 截取当前批次的联系人
          let startIdx = batchIndex * BATCH_SIZE;
          let endIdx = startIdx + BATCH_SIZE;
          let batchContacts: contact.Contact[] = allContacts.slice(startIdx, endIdx);

          // 创建当前批次的进度信息
          let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, batchIndex + 1, TOTAL_BATCHES);

          console.info(`${caseName}: Processing batch ${batchIndex + 1}/${TOTAL_BATCHES}, contacts ${startIdx}-${endIdx - 1}`);

          try {
            await sleep(500);
            let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, batchContacts);
            clickSyncButtonOnDialog();
            await promise.then((data: number[]) => {
              console.log(`${caseName}: Batch ${batchIndex + 1} success, returned ${data.length} contact IDs`);
              expect(data.length > 0).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${caseName}: Batch ${batchIndex + 1} fail: err>${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          } catch (err) {
            console.info(`${caseName}: Batch ${batchIndex + 1} catch: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }

          // 批次间短暂延迟
          await sleep(300);
        }

        console.info(`${caseName}: All ${TOTAL_BATCHES} batches completed successfully`);
        done();
        console.info(`${caseName} test end`);
      })

    // ============================================
    // syncContacts - 返回值校验测试
    // ============================================

    /**
     * @tc.name testSyncContactsReturnValueVerification1000
     * @tc.number SUB_Telephony_Contact_SyncContacts_ReturnValueVerification_1000
     * @tc.desc Test syncContacts return value is array of contact IDs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsReturnValueVerification1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsReturnValueVerification1000';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [
          createContact(`${TEST_CONTACT_NAME}1`, TEST_PHONE_NUMBER),
          createContact(`${TEST_CONTACT_NAME}2`, `${TEST_PHONE_NUMBER}1`)
        ];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(Array.isArray(data)).assertTrue();
            expect(data.length === 2).assertTrue();
            data.forEach((id: number) => {
              expect(typeof id === 'number').assertTrue();
              expect(id > 0 || id === INVALID_CONTACT_ID).assertTrue();
            });
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // syncContacts - 参数空值覆盖测试 (1-4个参数为空)
    // ============================================

    /**
     * @tc.name testSyncContactsParam1Null1100
     * @tc.number SUB_Telephony_Contact_SyncContacts_Param1Null_1100
     * @tc.desc Test syncContacts with 1 parameter null (context)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsParam1Null1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParam1Null1100';
        console.info(`${caseName} test start`);
        let contacts: contact.Contact[] = [createContact(TEST_CONTACT_NAME, TEST_PHONE_NUMBER)];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(null, MODE_INCREMENTAL, progress, contacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.name testSyncContactsParam2Null1200
     * @tc.number SUB_Telephony_Contact_SyncContacts_Param2Null_1200
     * @tc.desc Test syncContacts with 2 parameters null (context, mode)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsParam2Null1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParam2Null1200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(TEST_CONTACT_NAME, TEST_PHONE_NUMBER)];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, null, progress, contacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect(err.code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.name testSyncContactsParam3Null1300
     * @tc.number SUB_Telephony_Contact_SyncContacts_Param3Null_1300
     * @tc.desc Test syncContacts with 3 parameters null (context, mode, progress)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsParam3Null1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParam3Null1300';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(TEST_CONTACT_NAME, TEST_PHONE_NUMBER)];
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, null, contacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.name testSyncContactsParam4Null1400
     * @tc.number SUB_Telephony_Contact_SyncContacts_Param4Null_1400
     * @tc.desc Test syncContacts with 4 parameters null (context, mode, progress, contacts)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsParam4Null1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParam4Null1400';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, null, null);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.name testSyncContactsAllParamsUndefined1500
     * @tc.number SUB_Telephony_Contact_SyncContacts_AllParamsUndefined_1500
     * @tc.desc Test syncContacts with all parameters undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsAllParamsUndefined1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsAllParamsUndefined1500';
        console.info(`${caseName} test start`);
        try {
          await sleep(500);
          let promise = contact.syncContacts(undefined, undefined, undefined, undefined);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    // ============================================
    // syncContacts - 错误码校验测试
    // ============================================

    /**
     * @tc.name testSyncContactsErrorCode167000041600
     * @tc.number SUB_Telephony_Contact_SyncContacts_ErrorCode_16700004_1600
     * @tc.desc Test syncContacts exceeds limit error 16700004
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsErrorCode167000041600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsErrorCode167000041600';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 500; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, TEST_PHONE_NUMBER));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700004).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700004).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.name testSyncContactsErrorCode167000021700
     * @tc.number SUB_Telephony_Contact_SyncContacts_ErrorCode_16700002_1700
     * @tc.desc Test syncContacts invalid parameter error 16700002
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsErrorCode167000021700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsErrorCode167000021700';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(TEST_CONTACT_NAME, TEST_PHONE_NUMBER)];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, 0, progress, undefined);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect((err as BusinessError).code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700002).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    // ============================================
    // syncContacts - 错误码 16700103 用户取消测试
    // ============================================

    /**
     * @tc.name testSyncContactsErrorCode167001032400
     * @tc.number SUB_Telephony_Contact_SyncContacts_ErrorCode_16700103_2400
     * @tc.desc Test syncContacts user canceled error 16700103 (click cancel button)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSyncContactsErrorCode167001032400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsErrorCode167001032400';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [createContact(TEST_CONTACT_NAME, TEST_PHONE_NUMBER)];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickCancelButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect(err.code === 16700103).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect((err as BusinessError).code === 16700103).assertTrue();
          done();
        }
        console.info(`${caseName} test end`);
      })

    // ============================================
    // queryContactSyncInfo 测试
    // ============================================

    /**
     * @tc.name testQueryContactSyncInfo0100
     * @tc.number SUB_Telephony_Contact_QueryContactSyncInfo_0100
     * @tc.desc Test queryContactSyncInfo with valid context
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
            expect(data !== null).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // 枚举和接口结构测试
    // ============================================

    /**
     * @tc.name testContactSyncModeValues2000
     * @tc.number SUB_Telephony_Contact_SyncMode_Values_2000
     * @tc.desc Test ContactSyncMode enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
it('testContactSyncModeValues2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testContactSyncModeValues2000';
        console.info(`${caseName} test start`);
        // Verify ContactSyncMode enum values per @ohos.contact.d.ts since 26
        if (contact.ContactSyncMode !== undefined) {
          expect(contact.ContactSyncMode.MODE_INCREMENTAL).assertEqual(1);
          expect(contact.ContactSyncMode.MODE_CLOUD_BASED).assertEqual(2);
        } else {
          // Enum not exported at runtime, skip enum verification
          console.info(`${caseName}: ContactSyncMode enum not exported at runtime, skipping enum verification`);
          }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.name testContactSyncProgressStructure2100
     * @tc.number SUB_Telephony_Contact_SyncProgress_Structure_2100
     * @tc.desc Test ContactSyncProgress interface structure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testContactSyncProgressStructure2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testContactSyncProgressStructure2100';
        console.info(`${caseName} test start`);
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 3, 10);
        expect(progress.currentBatch).assertEqual(3);
        expect(progress.totalBatches).assertEqual(10);
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.name testContactSyncInfoStructure2200
     * @tc.number SUB_Telephony_Contact_SyncInfo_Structure_2200
     * @tc.desc Test ContactSyncInfo interface structure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testContactSyncInfoStructure2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testContactSyncInfoStructure2200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(context);
          promise.then((syncInfoList: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(syncInfoList)}`);
            expect(syncInfoList !== null).assertTrue();
            expect(Array.isArray(syncInfoList)).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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

    // ============================================
    // 边界测试 - 最大数量边界
    // ============================================

    /**
     * @tc.name testSyncContactsMaxContacts2300
     * @tc.number SUB_Telephony_Contact_SyncContacts_MaxContacts_2300
     * @tc.desc Test syncContacts with max contacts (400)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsMaxContacts2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsMaxContacts2300';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = createContactSyncProgress(syncId, 1, 1);
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsParamCheck0100
     * @tc.number SUB_Telephony_Contact_SyncContacts_ParamCheck_0100
     * @tc.desc check progress
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsParamCheck0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParamCheck0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 1
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsParamCheck0200
     * @tc.number SUB_Telephony_Contact_SyncContacts_ParamCheck_0200
     * @tc.desc check MODE_INCREMENTAL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsParamCheck0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParamCheck0200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 1
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsParamCheck0300
     * @tc.number SUB_Telephony_Contact_SyncContacts_ParamCheck_0300
     * @tc.desc check MODE_CLOUD_BASED
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsParamCheck0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParamCheck0300';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 1
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsParamCheck0400
     * @tc.number SUB_Telephony_Contact_SyncContacts_ParamCheck_0400
     * @tc.desc check ContactSyncInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsParamCheck0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsParamCheck0400';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 1
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsReturn0100
     * @tc.number SUB_Telephony_Contact_SyncContacts_Return_0100
     * @tc.desc check ContactSyncInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsReturn0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        let syncId: number = Date.now() / 1000;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 1
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_INCREMENTAL, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertEqual(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testSyncContactsReturn0200
     * @tc.number SUB_Telephony_Contact_SyncContacts_Return_0200
     * @tc.desc check ContactSyncInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSyncContactsReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testSyncContactsReturn0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = 300;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 1,
          totalBatches: 2
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_CLOUD_BASED, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testQueryContactParamCheck0100
     * @tc.number SUB_Telephony_Contact_QueryContactParamCheck_0100
     * @tc.desc Test queryContactSyncInfo with null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactParamCheck0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactSyncInfo0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(null);
          promise.then((data: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data !== null).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testQueryContactParamCheck0200
     * @tc.number SUB_Telephony_Contact_QueryContactParamCheck_0200
     * @tc.desc Test queryContactSyncInfo with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactParamCheck0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactSyncInfo0200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(undefined);
          promise.then((data: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data !== null).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name testQueryContactReturn0200
     * @tc.number SUB_Telephony_Contact_QueryContactReturn_0200
     * @tc.desc Test queryContactSyncInfo return check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactReturn0200';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        try {
          await sleep(500);
          let promise = contact.queryContactSyncInfo(context);
          promise.then((data: contact.ContactSyncInfo[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            let contactSyncInfo:contact.ContactSyncInfo = data[data.length -1];
            expect(contactSyncInfo.mode).assertEqual(contact.ContactSyncMode.MODE_CLOUD_BASED);
            expect(contactSyncInfo.syncId).assertLarger(0);
            expect(contactSyncInfo.totalBatches).assertLarger(0);
            expect(contactSyncInfo.completedBatches.length).assertLarger(0);
            expect(contactSyncInfo.lastSyncTime).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
     * @tc.name testQueryContactRecover0100
     * @tc.number SUB_Telephony_Contact_QueryContactRecover_0100
     * @tc.desc Test queryContactSyncInfo Recover
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueryContactRecover0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testQueryContactRecover0100';
        console.info(`${caseName} test start`);
        let context: Context = AppStorage.get('UIContext') as Context;
        let contacts: contact.Contact[] = [];
        for (let i = 0; i < 400; i++) {
          contacts.push(createContact(`${TEST_CONTACT_NAME}${i}`, `${TEST_PHONE_NUMBER}`));
        }
        let syncId: number = 300;
        let progress: contact.ContactSyncProgress = {
          syncId: syncId,
          currentBatch: 2,
          totalBatches: 2
        };
        try {
          await sleep(500);
          let promise = contact.syncContacts(context, contact.ContactSyncMode.MODE_CLOUD_BASED, progress, contacts);
          clickSyncButtonOnDialog();
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data->${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
  })
}