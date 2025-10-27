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
import cloudsync from 'libcloudsync.so';
import { fileUri } from '@kit.CoreFileKit';
import { common, UIAbility } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

export default function CloudSyncNdkTest(){
  describe('CloudSyncNdkTest',async () => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0100
     * @tc.name FileShare_PersistPermission_001
     * @tc.desc Test persistPermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_PersistPermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test1.txt";
      console.info("FileShare_PersistPermission_001: " + filepath);
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = cloudsync.FileShare_001();
      console.info("FileShare_PersistPermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    
  });
}