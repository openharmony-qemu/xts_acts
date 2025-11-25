/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import storageStatistics from '@ohos.file.storageStatistics';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: number = 0x0000; // 日志标识, 0x0000作为测试框架的业务标识
let tag: string = 'testTag'; // 日志标识字符串
const FILE_CONTENT = 'hello world';

export default function storageStatistics_test() {
  const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const context = abilityDelegator.getAppContext();

  describe("storageStatistics_test", () => {
    hilog.info(domain, tag, '%{public}s', 'storageStatistics_test start');

    /**
     * @tc.number SUB_DF_STATISTICS_GET_CURRENT_BUNDLE_STATS_ASYNC_0000
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_static_000
     * @tc.desc Test getCurrentBundleStats() interfaces
     * Test getCurrentBundleStats().
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_current_bundle_stats_async_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_000 START');

        try {
          const bundleStat = await storageStatistics.getCurrentBundleStats();
          expect(bundleStat != null).assertTrue();
          expect(await Utils.isIntNum(bundleStat.appSize) && !await Utils.isNegativeNum(bundleStat.appSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.cacheSize) && !await Utils.isNegativeNum(bundleStat.cacheSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.dataSize) && !await Utils.isNegativeNum(bundleStat.dataSize))
            .assertTrue();
        } catch (e) {
          hilog.info(domain, tag, '%{public}s',
            'storage_statistics_test_get_current_bundle_stats_async_000 has failed for ' + (e as BusinessError).message);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_000 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_CURRENT_BUNDLE_STATS_ASYNC_0001
     * @tc.name storage_statistics_test_get_current_bundle_stats_async_static_001
     * @tc.desc Test getCurrentBundleStats() interfaces
     * Test getCurrentBundleStats(callback: AsyncCallback<BundleStats>).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_current_bundle_stats_async_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_001 START');

        try {
          const bundleStat = await new Promise<storageStatistics.BundleStats>((resolve, reject) => {
            storageStatistics.getCurrentBundleStats((error: BusinessError | null,
              bundleStat: storageStatistics.BundleStats | undefined) => {
              if (error !== null || bundleStat === undefined) {
                reject(error || new Error('BundleStats is undefined'));
              } else {
                resolve(bundleStat);
              }
            });
          });

          expect(bundleStat != null).assertTrue();
          expect(await Utils.isIntNum(bundleStat.appSize) && !await Utils.isNegativeNum(bundleStat.appSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.cacheSize) && !await Utils.isNegativeNum(bundleStat.cacheSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.dataSize) && !await Utils.isNegativeNum(bundleStat.dataSize))
            .assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `unknown error: ${err}`);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_001 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_USER_STORAGE_STATS_ASYNC_0000
     * @tc.name storage_statistics_test_get_user_storage_stats_async_static_000
     * @tc.desc Test getUserStorageStats() interfaces
     * Test getUserStorageStats().
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_user_storage_stats_async_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_000 START');

        try {
          const userStat = await storageStatistics.getUserStorageStats();
          hilog.info(domain, tag, 'userStat.total : %{public}s', String(userStat.total));
        } catch (e) {
          const err = e as BusinessError;
          hilog.error(domain, tag, 'getUserStorageStats failed: code=%{public}d, msg=%{public}s', err.code, err.message);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_000 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_USER_STORAGE_STATS_ASYNC_0001
     * @tc.name storage_statistics_test_get_user_storage_stats_async_static_001
     * @tc.desc Test getUserStorageStats() interfaces
     * Test getUserStorageStats(callback: AsyncCallback<StorageStats>).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_user_storage_stats_async_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_001 START');

        try {
          const storageStat = await new Promise<storageStatistics.StorageStats>((resolve, reject) => {
            storageStatistics.getUserStorageStats((error: BusinessError | null,
              storageStat: storageStatistics.StorageStats | undefined) => {
              if (error !== null || storageStat === undefined) {
                reject(error || new Error('StorageStats is undefined'));
              } else {
                resolve(storageStat);
              }
            });
          });

          hilog.info(domain, tag, 'storageStat.total : %{public}s', String(storageStat.total));
        } catch (err) {
          hilog.info(domain, tag, `unknown error: ${err}`);
          const e = err as BusinessError;
          hilog.error(domain, tag,
            'Test failed with error - Code: %{public}d, Msg: %{public}s',
            e.code, e.message);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_001 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_USER_STORAGE_STATS_ASYNC_0002
     * @tc.name storage_statistics_test_get_user_storage_stats_async_static_002
     * @tc.desc Test getUserStorageStats(userId: long).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_user_storage_stats_async_static_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_002 START');

        try {
          const userId = 100;
          const userStat = await storageStatistics.getUserStorageStats(userId);
          hilog.info(domain, tag, 'userStat.total : %{public}s', String(userStat.total));
        } catch (e) {
          const err = e as BusinessError;
          hilog.error(domain, tag, 'getUserStorageStats failed: code=%{public}d, msg=%{public}s', err.code, err.message);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_002 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_USER_STORAGE_STATS_ASYNC_0003
     * @tc.name storage_statistics_test_get_user_storage_stats_async_static_003
     * @tc.desc Test getUserStorageStats(userId: long, callback: AsyncCallback<StorageStats>).
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storage_statistics_test_get_user_storage_stats_async_static_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_003 START');

        try {
          const userId = 100;
          const storageStat = await new Promise<storageStatistics.StorageStats>((resolve, reject) => {
            storageStatistics.getUserStorageStats(userId, (error: BusinessError | null,
              storageStat: storageStatistics.StorageStats | undefined) => {
              if (error !== null || storageStat === undefined) {
                reject(error || new Error('StorageStats is undefined'));
              } else {
                resolve(storageStat);
              }
            });
          });

          hilog.info(domain, tag, 'storageStat.total : %{public}s', String(storageStat.total));
        } catch (err) {
          hilog.info(domain, tag, `unknown error: ${err}`);
          const e = err as BusinessError;
          hilog.error(domain, tag,
            'Test failed with error - Code: %{public}d, Msg: %{public}s',
            e.code, e.message);
          expect(false).assertTrue();
        }

        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_user_storage_stats_async_003 END');
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_SYNC_0000
     * @tc.name storageStatistics_test_get_free_size_sync_static_000
     * @tc.desc Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_free_size_sync_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_sync_static_000 start');
        try {
          const num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag,
            `storageStatistics_test_get_free_size_sync_static_000 getFreeSize getFilesDir===> ${num / 1024}`);
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_sync_static_000 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_SYNC_0100
     * @tc.name storageStatistics_test_get_free_size_sync_static_001
     * @tc.desc Test getFreeSize() interfaces, when the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_free_size_sync_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_sync_static_001 start');
        try {
          const num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag,
            'storageStatistics_test_get_free_size_sync_static_001 getFreeSize dev===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_sync_static_001 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_SYNC_0000
     * @tc.name storageStatistics_test_get_total_size_sync_static_000
     * @tc.desc Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_total_size_sync_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_sync_static_000 start');
        try {
          const num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag,
            'storageStatistics_test_get_total_size_sync_static_000 getTotalSizeNumber getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_000 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_SYNC_0100
     * @tc.name storageStatistics_test_get_total_size_sync_static_001
     * @tc.desc Test getTotalSize() interfaces, when the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_total_size_sync_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_sync_static_001 start');
        try {
          const num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag,
            'storageStatistics_test_get_total_size_sync_static_001 getTotalSizeNumber dev===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_001 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_0000
     * @tc.name storageStatistics_test_get_free_size_async_static_000
     * @tc.desc Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_free_size_async_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_000 start');
        try {
          const num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag,
            'storageStatistics_test_get_free_size_async_static_000 getFreeSize getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_async_static_000 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_0100
     * @tc.name storageStatistics_test_get_free_size_async_static_001
     * @tc.desc Test getFreeSize() interfaces, when the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_free_size_async_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_001 start');
        try {
          const num = await new Promise<number>((resolve, reject) => {
            storageStatistics.getFreeSize((err: BusinessError | null, num: number | undefined) => {
              if (err !== null || num === undefined) {
                reject(err || new Error('Free size is undefined'));
              } else {
                resolve(num);
              }
            });
          });
          hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_001 getFreeSize dev===> ');
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_async_static_001 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_0000
     * @tc.name storageStatistics_test_get_total_size_async_static_000
     * @tc.desc Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_total_size_async_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_000 start');
        try {
          const num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag,
            'storageStatistics_test_get_total_size_async_static_000 getTotalSize getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_async_static_000 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_0100
     * @tc.name storageStatistics_test_get_total_size_async_static_001
     * @tc.desc Test getTotalSize() interfaces, when the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('storageStatistics_test_get_total_size_async_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_001 start');
        try {
          const num = await new Promise<number>((resolve, reject) => {
            storageStatistics.getTotalSize((err: BusinessError | null, num: number | undefined) => {
              if (err !== null || num === undefined) {
                reject(err || new Error('Total size is undefined'));
              } else {
                resolve(num);
              }
            });
          });
          hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_001 getTotalSize dev===> ');
          expect(await Utils.isIntNum(num)).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_async_static_001 has failed for ' + err.message + ' code: ' + err.code);
          expect(false).assertTrue();
        }
      });
  });

  hilog.info(domain, tag, '%{public}s', 'storageStatistics_test end');
}