// @ts-nocheck
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import update from '@ohos.update';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

export default function updateSystemHapTest() {
  describe('updateSystemHapTest', (): void => {
    const NOT_SYSTEM_HAP = 202;
    let updater: update.Updater;
    let restorer: update.Restorer;
    let localUpdater: update.LocalUpdater;
    let upgradeInfo: update.UpgradeInfo = {
      upgradeApp: "com.hmos.ouc",
      businessType: {
        vendor: update.BusinessVendor.PUBLIC,
        subType: update.BusinessSubType.FIRMWARE
      }
    };
    let taskCallback: update.UpgradeTaskCallback = (eventInfo: update.EventInfo) => {
      console.info('onTest callback checkRet = ' + eventInfo);
    };

    beforeAll(():void => {
    });
    beforeEach(():void => {
    });
    afterEach(():void => {
    });
    afterAll(():void => {
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0001
     * @tc.name      updateSystemHapTest001
     * @tc.desc      To test hap is not system hap and  invoke getOnlineUpdater api(promise).
     */
    it('updateSystemHapTest001', Level.LEVEL1, async  (done: () => void) => {
      console.info('updateSystemHapTest001 START');
      try{
        let updater = update.getOnlineUpdater(upgradeInfo);
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest001 catch " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0002
     * @tc.name      updateSystemHapTest002
     * @tc.desc      To test hap is not system hap and  invoke applyNewVersion api(promise).
     */
    it('updateSystemHapTest002', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest002 START');
      try{
        let restorer = update.getRestorer();
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest002 catch " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0003
     * @tc.name      updateSystemHapTest003
     * @tc.desc      To test hap is not system hap and  invoke applyNewVersion api(promise).
     */
    it('updateSystemHapTest003', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest003 START');
      try{
        let localUpdater = update.getLocalUpdater();
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest003 catch " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0004
     * @tc.name      updateSystemHapTest004
     * @tc.desc      To test hap is not system hap and  invoke checkNewVersion api(callback).
     */
    it('updateSystemHapTest004', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest004 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.checkNewVersion((err: BusinessError<void>|null, data: update.CheckResult|undefined) => {
          console.error("updateSystemHapTest004 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest004 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0005
     * @tc.name      updateSystemHapTest005
     * @tc.desc      To test hap is not system hap and  invoke checkNewVersion api(promise).
     */
    it('updateSystemHapTest005', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest005 START');
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.checkNewVersion().then((res: update.CheckResult) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest005 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0006
     * @tc.name      updateSystemHapTest006
     * @tc.desc      To test hap is not system hap and  invoke getNewVersionInfo api(callback).
     */
    it('updateSystemHapTest006', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest006 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getNewVersionInfo((err: BusinessError<void>|null, data: update.NewVersionInfo|undefined) => {
          console.error("updateSystemHapTest006 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest006 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0007
     * @tc.name      updateSystemHapTest007
     * @tc.desc      To test hap is not system hap and  invoke getNewVersionInfo api(promise).
     */
    it('updateSystemHapTest007', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest007 START');
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.getNewVersionInfo().then((res: update.NewVersionInfo) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest007 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0008
     * @tc.name      updateSystemHapTest008
     * @tc.desc      To test hap is not system hap and  invoke getNewVersionDescription api(callback).
     */
    it('updateSystemHapTest008', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest008 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD, // 标准格式
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getNewVersionDescription(versionDigestInfo, descriptionOptions, (err: BusinessError<void>|null, data: Array<update.ComponentDescription>|undefined) => {
          console.error("updateSystemHapTest008 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest008 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0009
     * @tc.name      updateSystemHapTest009
     * @tc.desc      To test hap is not system hap and  invoke getNewVersionDescription api(promise).
     */
    it('updateSystemHapTest009', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest009 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const descriptionOptions: update.DescriptionOptions = {
        format: update.DescriptionFormat.STANDARD, // 标准格式
        language: "zh-cn" // 中文
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.getNewVersionDescription(versionDigestInfo, descriptionOptions).then((res: Array<update.ComponentDescription>) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest009 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0010
     * @tc.name      updateSystemHapTest010
     * @tc.desc      To test hap is not system hap and  invoke getCurrentVersionInfo api(callback).
     */
    it('updateSystemHapTest010', Level.LEVEL2, async  (done: () => void) => {
      console.info('updateSystemHapTest007 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getCurrentVersionInfo((err: BusinessError<void>|null, data: update.CurrentVersionInfo|undefined) => {
          console.error("updateSystemHapTest010 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest010 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
      done();
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0011
     * @tc.name      updateSystemHapTest011
     * @tc.desc      To test hap is not system hap and  invoke getCurrentVersionInfo api(promise).
     */
    it('updateSystemHapTest011', Level.LEVEL2, async () : Promise<void> => {
      updater = update.getOnlineUpdater(upgradeInfo);
      console.info('updateSystemHapTest008 START');
      updater.getCurrentVersionInfo().then((res: update.CurrentVersionInfo) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest011 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0012
     * @tc.name      updateSystemHapTest012
     * @tc.desc      To test hap is not system hap and  invoke getCurrentVersionDescription api(callback).
     */
    it('updateSystemHapTest012', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest012 START');
      try{
        const descriptionOptions: update.DescriptionOptions = {
          format: update.DescriptionFormat.STANDARD, // 标准格式
          language: "zh-cn" // 中文
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getCurrentVersionDescription(descriptionOptions, (err: BusinessError<void>|null, data: Array<update.ComponentDescription>|undefined) => {
          console.error("updateSystemHapTest012 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest012 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0013
     * @tc.name      updateSystemHapTest013
     * @tc.desc      To test hap is not system hap and  invoke getCurrentVersionDescription api(promise).
     */
    it('updateSystemHapTest013', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest013 START');
      const descriptionOptions: update.DescriptionOptions = {
        format: update.DescriptionFormat.STANDARD, // 标准格式
        language: "zh-cn" // 中文
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.getCurrentVersionDescription(descriptionOptions).then((res: Array<update.ComponentDescription>) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest013 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0014
     * @tc.name      updateSystemHapTest014
     * @tc.desc      To test hap is not system hap and  invoke getTaskInfo api(callback).
     */
    it('updateSystemHapTest014', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest014 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getTaskInfo((err: BusinessError<void>|null, data: update.TaskInfo|undefined) => {
          console.error("updateSystemHapTest014 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest014 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0015
     * @tc.name      updateSystemHapTest015
     * @tc.desc      To test hap is not system hap and  invoke getTaskInfo api(promise).
     */
    it('updateSystemHapTest015', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest015 START');
      updater.getTaskInfo().then((res: update.TaskInfo) => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        console.error("updateSystemHapTest015 catch " + JSON.stringify(err));
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0016
     * @tc.name      updateSystemHapTest016
     * @tc.desc      To test hap is not system hap and  invoke download api(callback).
     */
    it('updateSystemHapTest016', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest016 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const downloadOptions: update.DownloadOptions = {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
          order: update.Order.DOWNLOAD // 下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.download(versionDigestInfo, downloadOptions, (err) => {
          console.error("updateSystemHapTest016 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest016 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0017
     * @tc.name      updateSystemHapTest017
     * @tc.desc      To test hap is not system hap and  invoke download api(promise).
     */
    it('updateSystemHapTest017', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest017 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const downloadOptions: update.DownloadOptions = {
        allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
        order: update.Order.DOWNLOAD // 下载
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.download(versionDigestInfo, downloadOptions).then(() => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0018
     * @tc.name      updateSystemHapTest018
     * @tc.desc      To test hap is not system hap and  invoke resumeDownload api(callback).
     */
    it('updateSystemHapTest018', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest018 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const resumeDownloadOptions: update.ResumeDownloadOptions = {
          allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.resumeDownload(versionDigestInfo, resumeDownloadOptions, (err) => {
          console.error("updateSystemHapTest018 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest018 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0019
     * @tc.name      updateSystemHapTest019
     * @tc.desc      To test hap is not system hap and  invoke resumeDownload api(promise).
     */
    it('updateSystemHapTest019', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest019 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const resumeDownloadOptions: update.ResumeDownloadOptions = {
        allowNetwork: update.NetType.CELLULAR, // 允许数据网络下载
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.resumeDownload(versionDigestInfo, resumeDownloadOptions).then(() => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0020
     * @tc.name      updateSystemHapTest020
     * @tc.desc      To test hap is not system hap and  invoke pauseDownload api(callback).
     */
    it('updateSystemHapTest020', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest020 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const pauseDownloadOptions: update.PauseDownloadOptions = {
          isAllowAutoResume: true // 允许自动恢复下载
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.pauseDownload(versionDigestInfo, pauseDownloadOptions, (err) => {
          console.error("updateSystemHapTest020 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest020 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0021
     * @tc.name      updateSystemHapTest021
     * @tc.desc      To test hap is not system hap and  invoke pauseDownload api(promise).
     */
    it('updateSystemHapTest021', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest021 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const pauseDownloadOptions: update.PauseDownloadOptions = {
        isAllowAutoResume: true // 允许自动恢复下载
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.pauseDownload(versionDigestInfo, pauseDownloadOptions).then(() => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0022
     * @tc.name      updateSystemHapTest022
     * @tc.desc      To test hap is not system hap and  invoke upgrade api(callback).
     */
    it('updateSystemHapTest022', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest022 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const upgradeOptions: update.UpgradeOptions = {
          order: update.Order.INSTALL // 安装指令
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.upgrade(versionDigestInfo, upgradeOptions, (err) => {
          console.error("updateSystemHapTest022 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest022 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0023
     * @tc.name      updateSystemHapTest023
     * @tc.desc      To test hap is not system hap and  invoke upgrade api(promise).
     */
    it('updateSystemHapTest023', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest023 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const upgradeOptions: update.UpgradeOptions = {
        order: update.Order.INSTALL // 安装指令
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.upgrade(versionDigestInfo, upgradeOptions).then(() => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0024
     * @tc.name      updateSystemHapTest024
     * @tc.desc      To test hap is not system hap and  invoke clearError api(callback).
     */
    it('updateSystemHapTest024', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest024 START');
      try{
        const versionDigestInfo: update.VersionDigestInfo = {
          versionDigest: "versionDigest" // 检测结果中的版本摘要信息
        };
        const clearOptions: update.ClearOptions = {
          status: update.UpgradeStatus.UPGRADE_FAIL,
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.clearError(versionDigestInfo, clearOptions, (err) => {
          console.error("updateSystemHapTest024 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest024 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0025
     * @tc.name      updateSystemHapTest025
     * @tc.desc      To test hap is not system hap and  invoke clearError api(promise).
     */
    it('updateSystemHapTest025', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest025 START');
      const versionDigestInfo: update.VersionDigestInfo = {
        versionDigest: "versionDigest" // 检测结果中的版本摘要信息
      };
      const clearOptions: update.ClearOptions = {
        status: update.UpgradeStatus.UPGRADE_FAIL,
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.clearError(versionDigestInfo, clearOptions).then(() => {
      }).catch((error: Error) => {
        let err: BusinessError = error as BusinessError;
        expect(err == NOT_SYSTEM_HAP).assertTrue();
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0026
     * @tc.name      updateSystemHapTest026
     * @tc.desc      To test hap is not system hap and  invoke getUpgradePolicy api(callback).
     */
    it('updateSystemHapTest026', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest026 START');
      try{
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.getUpgradePolicy((err: BusinessError<void>|null, data: update.UpgradePolicy|undefined) => {
          console.error("updateSystemHapTest026 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest026 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0027
     * @tc.name      updateSystemHapTest027
     * @tc.desc      To test hap is not system hap and  invoke getUpgradePolicy api(promise).
     */
    it('updateSystemHapTest027', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest027 START');
      updater.getUpgradePolicy().then((result: update.UpgradePolicy) => {
      }).catch((err: Error) => {
        let errInfo: BusinessError = err as BusinessError;
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      })
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0028
     * @tc.name      updateSystemHapTest028
     * @tc.desc      To test hap is not system hap and  invoke setUpgradePolicy api(callback).
     */
    it('updateSystemHapTest028', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest025 START');
      try{
        const policy: update.UpgradePolicy = {
          downloadStrategy: false,
          autoUpgradeStrategy: false,
          autoUpgradePeriods: [ { start: 120, end: 240 } ] // 自动升级时间段，用分钟表示
        };
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.setUpgradePolicy(policy, (err) => {
          console.error("updateSystemHapTest028 catch1 " + JSON.stringify(err));
          expect(null).assertFail();
        });
      } catch(err) {
        console.error("updateSystemHapTest028 catch2 " + JSON.stringify(err));
        expect(err).assertEqual(NOT_SYSTEM_HAP);
      }
    });

    /**
     * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0029
     * @tc.name      updateSystemHapTest029
     * @tc.desc      To test hap is not system hap and  invoke setUpgradePolicy api(promise).
     */
    it('updateSystemHapTest029', Level.LEVEL2, async () : Promise<void> => {
      console.info('updateSystemHapTest029 START');
      const policy: update.UpgradePolicy = {
        downloadStrategy: false,
        autoUpgradeStrategy: false,
        autoUpgradePeriods: [ { start: 120, end: 240 } ] // 自动升级时间段，用分钟表示
      };
      updater = update.getOnlineUpdater(upgradeInfo);
      updater.setUpgradePolicy(policy).then(() => {
      }).catch((error: Error) => {
        let errInfo: BusinessError = error as BusinessError;
        expect(errInfo).assertEqual(NOT_SYSTEM_HAP);
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0030
       * @tc.name      updateSystemHapTest030
       * @tc.desc      To test hap is not system hap and  invoke terminateUpgrade api(callback).
       */
      it('updateSystemHapTest030', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest030 START');
        try{
          updater = update.getOnlineUpdater(upgradeInfo);
          updater.terminateUpgrade((err) => {
            console.error("updateSystemHapTest030 catch1 " + JSON.stringify(err));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest030 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0031
       * @tc.name      updateSystemHapTest031
       * @tc.desc      To test hap is not system hap and  invoke terminateUpgrade api(promise).
       */
      it('updateSystemHapTest031', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest031 START');
        updater = update.getOnlineUpdater(upgradeInfo);
        updater.terminateUpgrade().then(() => {
        }).catch((error: Error) => {
          let err: BusinessError = error as BusinessError;
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        })
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0032
       * @tc.name      updateSystemHapTest032
       * @tc.desc      To test hap is not system hap and  invoke on api(callback).
       */
      it('updateSystemHapTest032', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest032 START');
        try{
          const eventClassifyInfo: update.EventClassifyInfo = {
            eventClassify : update.EventClassify.TASK,
            extraInfo: ""
          };
          updater = update.getOnlineUpdater(upgradeInfo);
          localUpdater.on(eventClassifyInfo, taskCallback => {
            console.error("updateSystemHapTest032 catch1 " + JSON.stringify(taskCallback));
            expect(null).assertFail();
          });
        } catch(error) {
          let err: BusinessError = error as BusinessError;
          console.error("updateSystemHapTest032 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0033
       * @tc.name      updateSystemHapTest033
       * @tc.desc      To test hap is not system hap and  invoke off api(callback).
       */
      it('updateSystemHapTest033', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest033 START');
        try{
          const eventClassifyInfo: update.EventClassifyInfo = {
            eventClassify : update.EventClassify.TASK,
            extraInfo: ""
          };
          updater = update.getOnlineUpdater(upgradeInfo);
          localUpdater.off(eventClassifyInfo, taskCallback => {
            console.error("updateSystemHapTest033 catch1 " + JSON.stringify(taskCallback));
            expect(null).assertFail();
          });
        } catch(error) {
          let err: BusinessError = error as BusinessError;
          console.error("updateSystemHapTest033 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0034
       * @tc.name      updateSystemHapTest034
       * @tc.desc      To test hap is not system hap and  invoke factoryReset api(callback).
       */
      it('updateSystemHapTest034', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest034 START');
        try{
          restorer = update.getRestorer();
          restorer.factoryReset((err) => {
            console.error("updateSystemHapTest032 catch1 " + JSON.stringify(err));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest034 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0035
       * @tc.name      updateSystemHapTest035
       * @tc.desc      To test hap is not system hap and  invoke factoryReset api(promise).
       */
      it('updateSystemHapTest035', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest035 START');
        restorer.factoryReset().then(() => {
        }).catch((error: Error) => {
          let errInfo: BusinessError = error as BusinessError;
          expect(errInfo).assertEqual(NOT_SYSTEM_HAP);
        })
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0036
       * @tc.name      updateSystemHapTest036
       * @tc.desc      To test hap is not system hap and  invoke verifyUpgradePackage api(callback).
       */
      it('updateSystemHapTest036', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest036 START');
        try{
          const upgradeFile: update.UpgradeFile = {
            fileType: update.ComponentType.OTA,
            filePath: "/data/ota_package/updater.zip" // 本地升级包路径
          };
          localUpdater = update.getLocalUpdater();
          localUpdater.verifyUpgradePackage(upgradeFile, "cerstFilePath", (err) => {
            console.error("updateSystemHapTest036 catch1 " + JSON.stringify(err));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest036 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0037
       * @tc.name      updateSystemHapTest037
       * @tc.desc      To test hap is not system hap and  invoke verifyUpgradePackage api(promise).
       */
      it('updateSystemHapTest037', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest037 START');
        const upgradeFile: update.UpgradeFile = {
          fileType: update.ComponentType.OTA,
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        };
        localUpdater = update.getLocalUpdater();
        localUpdater.verifyUpgradePackage(upgradeFile, "cerstFilePath").then(() => {
        }).catch((err: Error) => {
          let errInfo: BusinessError = err as BusinessError;
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        })
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0038
       * @tc.name      updateSystemHapTest038
       * @tc.desc      To test hap is not system hap and  invoke applyNewVersion api(callback).
       */
      it('updateSystemHapTest038', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest038 START');
        try{
          const upgradeFiles: update.UpgradeFile[] = [{
            fileType: update.ComponentType.OTA,
            filePath: "/data/ota_package/updater.zip" // 本地升级包路径
          }];
          localUpdater = update.getLocalUpdater();
          localUpdater.applyNewVersion(upgradeFiles, (err) => {
            console.error("updateSystemHapTest038 catch1 " + JSON.stringify(err));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest038 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0039
       * @tc.name      updateSystemHapTest039
       * @tc.desc      To test hap is not system hap and  invoke applyNewVersion api(promise).
       */
      it('updateSystemHapTest039', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest039 START');
        const upgradeFiles: update.UpgradeFile[] = [{
          fileType: update.ComponentType.OTA,
          filePath: "/data/ota_package/updater.zip" // 本地升级包路径
        }];
        localUpdater = update.getLocalUpdater();
        localUpdater.applyNewVersion(upgradeFiles).then(() => {
        }).catch((err: Error) => {
          let errInfo: BusinessError = err as BusinessError;
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        })
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0040
       * @tc.name      updateSystemHapTest040
       * @tc.desc      To test hap is not system hap and  invoke on api(callback).
       */
      it('updateSystemHapTest040', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest040 START');
        try{
          const eventClassifyInfo: update.EventClassifyInfo = {
            eventClassify : update.EventClassify.TASK,
            extraInfo: ""
          };
          localUpdater = update.getLocalUpdater();
          localUpdater.on(eventClassifyInfo, taskCallback => {
            console.error("updateSystemHapTest040 catch1 " + JSON.stringify(taskCallback));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest040 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });

      /**
       * @tc.number    SUB_UPDATE_SYSTEM_HAP_TEST_0041
       * @tc.name      updateSystemHapTest041
       * @tc.desc      To test hap is not system hap and  invoke off api(callback).
       */
      it('updateSystemHapTest041', Level.LEVEL2, async () : Promise<void> => {
        console.info('updateSystemHapTest041 START');
        try{
          const eventClassifyInfo: update.EventClassifyInfo = {
            eventClassify : update.EventClassify.TASK,
            extraInfo: ""
          };
          localUpdater = update.getLocalUpdater();
          localUpdater.off(eventClassifyInfo, taskCallback => {
            console.error("updateSystemHapTest041 catch1 " + JSON.stringify(taskCallback));
            expect(null).assertFail();
          });
        } catch(err) {
          console.error("updateSystemHapTest041 catch2 " + JSON.stringify(err));
          expect(err).assertEqual(NOT_SYSTEM_HAP);
        }
      });
    })
  })
}