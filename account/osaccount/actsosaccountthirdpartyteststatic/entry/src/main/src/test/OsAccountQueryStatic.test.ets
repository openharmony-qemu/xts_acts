/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle.bundleManager'
import { BusinessError } from '@ohos.base';
import {describe, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let tag: string = 'testTag';

let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
hilog.info(0x0000, tag, "====>get os AccountManager finish====");

export default function ActsOsAccountThirdPartyTest_third_4_Static() {
  describe('ActsOsAccountThirdPartyTest_third_4_Static', () => {


    /**
    * @tc.number   ActsOsAccountQueryIdFormUid_0100
    * @tc.name     ActsOsAccountQueryIdFormUid_0100
    * @tc.desc     Verify that the user localId is obtained by uid getOsAccountLocalIdForUid callback
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0100 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>testLocalId: "+ testLocalId);
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        accountManager.getOsAccountLocalIdForUid(uid, (err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (localId) {
                expect(localId).assertEqual(testLocalId);
                hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err: BusinessError<void>) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormUid_0200
    * @tc.name     ActsOsAccountQueryIdFormUid_0200
    * @tc.desc     Verify that the user localId is obtained by uid getOsAccountLocalIdForUid promise
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUid_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0200 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        let localId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
        expect(localId).assertEqual(testLocalId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0200 end====");
        done();
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormUid_0300
    * @tc.name     ActsOsAccountQueryIdFormUid_0300
    * @tc.desc     Authentication failed to query user by uid -1 getOsAccountLocalIdForUid callback
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUid_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0300 start====");
        let incorrectUid: int = -1;
        accountManager.getOsAccountLocalIdForUid(incorrectUid, (err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0300 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err: BusinessError<void>) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormUid_0400
    * @tc.name     ActsOsAccountQueryIdFormUid_0400
    * @tc.desc     Authentication failed to query user by uid -1  getOsAccountLocalIdForUid promise
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUid_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0400 start====");
        let incorrectUid: int = -1;
        try {
          await accountManager.getOsAccountLocalIdForUid(incorrectUid);
          expect().assertFail();
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>get localId by uid err: "+ JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0400 end====");
          done();
        }
      });


    /**
    * @tc.number   ActsOsAccountQueryIdFormUidSync_0100
    * @tc.name     ActsOsAccountQueryIdFormUidSync_0100
    * @tc.desc     Verify that the user localId is obtained by uid getOsAccountLocalIdForUidSync
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUidSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>testLocalId: "+ testLocalId);
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(uid);
          console.log('getOsAccountLocalIdForUidSync successfully, localId: ' + localId);
          expect(localId).assertEqual(testLocalId);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormUidSync_0200
    * @tc.name     ActsOsAccountQueryIdFormUidSync_0200
    * @tc.desc     Authentication failed to query user by uid -1  getOsAccountLocalIdForUidSync
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormUidSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 start====");
        let incorrectUid: int = -1;
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(incorrectUid);
          hilog.info(0x0000, tag, "====>get localId: " + localId);
          expect().assertFail();
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 end====");
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormProcess_0100
    * @tc.name     ActsOsAccountQueryIdFormProcess_0100
    * @tc.desc     Verify that the user localId obtained from the current process uid getOsAccountLocalId callback
    * @tc.level    Level0
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0100 start====");
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        let testLocalId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        accountManager.getOsAccountLocalId((err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by process: "+ localId);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (localId) {
                expect(localId).assertEqual(testLocalId);
                hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err: BusinessError<void>) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountQueryIdFormProcess_0200
    * @tc.name     ActsOsAccountQueryIdFormProcess_0200
    * @tc.desc     Verify that the user localId obtained from the current process uid getOsAccountType callback
    * @tc.level    Level0
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountQueryIdFormProcess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0200 start====");
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        let testLocalId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        hilog.info(0x0000, tag, "====>testLocalId obtained by process: "+ testLocalId);
        let localId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>localId obtained by process: "+ localId);
        expect(localId).assertEqual(testLocalId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0200 end====");
        done();
      });

    /**
    * @tc.number   ActsOsAccountgetType_0100
    * @tc.name     ActsOsAccountgetType_0100
    * @tc.desc     Verify that the user type obtained from the current process uid getOsAccountType callback
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountgetType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0100 start====");
        accountManager.getOsAccountType((err: BusinessError<void> | null, accountType: osAccount.OsAccountType | undefined): void => {
          hilog.info(0x0000, tag, "====>get type err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>type obtained by process: "+ accountType);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              let a: osAccount.OsAccountType = osAccount.OsAccountType.ADMIN;
              expect(accountType).assertEqual(a);
              hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0100 end====");
            }
          } catch (err: BusinessError<void>) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountgetType_0200
    * @tc.name     ActsOsAccountgetType_0200
    * @tc.desc     Verify that the user type obtained from the current process uid getOsAccountType promise
    * @tc.level    Level0
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountgetType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0200 start====");
        try {
          let accountType: osAccount.OsAccountType = await accountManager.getOsAccountType();
          hilog.info(0x0000, tag, "====>type obtained by process: "+ accountType);
          expect(accountType).assertEqual(osAccount.OsAccountType.ADMIN);
          hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0200 end====");
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, '====>getOsAccountType err: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number   ActsOsAccountGetActivedOsAccountIds_0100
    * @tc.name     ActsOsAccountGetActivedOsAccountIds_0100
    * @tc.desc     query activated osAccount Ids getActivatedOsAccountLocalIds callback
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountGetActivedOsAccountIds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0100 start====");
        accountManager.getActivatedOsAccountLocalIds((err: BusinessError<void> | null, dataArray: Array<int> | undefined): void => {
          hilog.info(0x0000, tag, "====>ActsOsAccountGQueryActicedOsAccountIds_0100 err : "+ JSON.stringify(err));
          hilog.info(0x0000, tag, "====>ActsOsAccountGQueryActicedOsAccountIds_0100 dataArray: "+ dataArray);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (dataArray) {
                expect(dataArray?.length).assertLargerOrEqual(1);
                hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err: BusinessError<void>) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountGetActivedOsAccountIds_0200
    * @tc.name     ActsOsAccountGetActivedOsAccountIds_0200
    * @tc.desc     query activated osAccount Ids getActivatedOsAccountLocalIds promise
    * @tc.level    Level3
    * @tc.size     MediumTest
    * @tc.type     Function
    */
    it('ActsOsAccountGetActivedOsAccountIds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 start====");
        try {
          let dataArray: Array<int> = await accountManager.getActivatedOsAccountLocalIds();
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 data" + dataArray);
          expect(dataArray.length).assertLargerOrEqual(1);
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 err " + JSON.stringify(err));
          expect().assertFail();
          done();
        };
      });
  });
}