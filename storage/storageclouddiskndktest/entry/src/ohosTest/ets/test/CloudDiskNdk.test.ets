/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, Level } from '@ohos/hypium';
import clouddisk from 'libclouddisk.so';
import { fileUri } from '@kit.CoreFileKit';
import { common, UIAbility } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

export default function CloudDiskNdkTest(){
  describe('CloudDiskNdkTest',async () => {

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolder_0100
     * @tc.name CloudDisk_RegisterSyncFolder_001
     * @tc.desc Test RegisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_RegisterSyncFolder_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/";
      console.info("CloudDisk_RegisterSyncFolder_001: " + filepath);
      let ret = clouddisk.RegisterSyncFolder(filepath);
      console.info("CloudDisk_RegisterSyncFolder_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400002);
        done();
      }
      done();
    });


  });
}