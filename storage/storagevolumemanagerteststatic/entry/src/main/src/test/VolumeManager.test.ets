'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { volumeManager } from '@kit.CoreFileKit';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function volumeManagerTest() {
  describe('volumeManagerTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'volumeManagerTest describe start');

    /**
     * @tc.number SUB_STORAGE_GETEXTERNALDISKINFOS_PROMISE_STATIC_0000
     * @tc.name test_getExternalDiskInfos_Promise_static_000
     * @tc.desc Function of API, get all external disk infos. Test normal function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_getExternalDiskInfos_Promise_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        try {
          let disks: Array<volumeManager.ExternalDiskInfo> = await volumeManager.getExternalDiskInfos();
          hilog.info(domain, tag, 'getExternalDiskInfos successfully: %{public}s', JSON.stringify(disks));
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.error(domain, tag, 'Failed to getExternalDiskInfos. Code: %{public}d, message: %{public}s',
            err.code, err.message);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number SUB_STORAGE_GETEXTERNALDISKINFOS_PROMISE_STATIC_0100
     * @tc.name test_getExternalDiskInfos_Promise_static_001
     * @tc.desc Function of API, get all external disk infos. Test return value is Array type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test_getExternalDiskInfos_Promise_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        try {
          let disks: Array<volumeManager.ExternalDiskInfo> = await volumeManager.getExternalDiskInfos();
          hilog.info(domain, tag, 'getExternalDiskInfos result: %{public}s', JSON.stringify(disks));
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.error(domain, tag, 'Failed to getExternalDiskInfos. Code: %{public}d, message: %{public}s',
            err.code, err.message);
          expect(false).assertTrue();
          done();
        }
      });

    
    /**
     * @tc.number SUB_STORAGE_GETEXTERNALVOLUMEINFOS_PROMISE_STATIC_0000
     * @tc.name test_getExternalVolumeInfos_Promise_static_000
     * @tc.desc Function of API, get all external volume infos. Test normal function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_getExternalVolumeInfos_Promise_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        try {
          let volumes: Array<volumeManager.ExternalVolumeInfo> = await volumeManager.getExternalVolumeInfos();
          hilog.info(domain, tag, 'getExternalVolumeInfos successfully: %{public}s', JSON.stringify(volumes));
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.error(domain, tag, 'Failed to getExternalVolumeInfos. Code: %{public}d, message: %{public}s',
            err.code, err.message);
          expect(false).assertTrue();
          done();
        }
      });
    hilog.info(domain, tag, '%{public}s', 'volumeManagerTest describe end');
  });
}
