/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium-dynamic';
import { volumeManager } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function volumeManagerTest() {
  describe('getExternalDiskInfosTest',  () => {

    /**
     * @tc.name   test_getExternalDiskInfos_Promise_000
     * @tc.number SUB_STORAGE_GETEXTERNALDISKINFOS_PROMISE_0000
     * @tc.desc   Test getExternalDiskInfos with no parameters (normal call).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getExternalDiskInfos_Promise_000', Level.LEVEL0, async () => {
      try {
        let disks: Array<volumeManager.ExternalDiskInfo> = await volumeManager.getExternalDiskInfos();
        console.info('getExternalDiskInfos successfully:' + JSON.stringify(disks));
      } catch (error) {
        console.error(`Failed to getExternalDiskInfos. Code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
      }
    });
  })

    /**
     * @tc.name   test_getExternalVolumeInfos_Promise_000
     * @tc.number SUB_STORAGE_GETEXTERNALVOLUMEINFOS_PROMISE_0000
     * @tc.desc   Test getExternalVolumeInfos with no parameters (normal call).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getExternalVolumeInfos_Promise_000', Level.LEVEL0, async () => {
      try {
        let volumes: Array<volumeManager.ExternalVolumeInfo> = await volumeManager.getExternalVolumeInfos();
        console.info('getExternalVolumeInfos successfully:' + JSON.stringify(volumes));
      } catch (error) {
        console.error(`Failed to getExternalVolumeInfos. Code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
      }
    });
}
