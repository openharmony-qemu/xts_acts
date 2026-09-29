/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic'
import { zlib, BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.name   Acts_Unzip_Other_Owner_1000 
     * @tc.number Acts_Unzip_Other_Owner_1000
     * @tc.desc   test unzip other owner hap file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_Unzip_Other_Owner_1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 begin');
      let context = getContext();
      let dir = context.cacheDir;
      hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 dir:' + dir);
      let zipDest = dir + "/ActsUnZipOtherOwnerTest.hap"
      let unzipdir = dir;
      // Copy ActsUnZipOtherOwnerTest.hap from rawfile to sandbox cacheDir
      try {
        hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 start getRawFileContentSync');
        let resourceManager = context.resourceManager;
        let rawFileContent: Uint8Array = resourceManager.getRawFileContentSync('ActsUnZipOtherOwnerTest.hap');
        hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 getRawFileContentSync success, size: ' + rawFileContent.byteLength);
        let file = fileIo.openSync(zipDest, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
        hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 openSync success, fd: ' + file.fd);
        fileIo.writeSync(file.fd, rawFileContent.buffer);
        hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 writeSync success');
        fileIo.closeSync(file);
        hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 copy hap to cacheDir done');
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 copy hap to cacheDir failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
        return;
      }
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      }
      zlib.unzipFile(zipDest, unzipdir, options).then((data: void) => {
          hilog.info(0x0000, 'testTag', "Acts_Unzip_Other_Owner_1000 data: " + data);
          expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
          done();
      }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', "unzipFile fail: " + err);
          expect().assertFail();
          done();
      })
      hilog.info(0x0000, 'testTag', 'Acts_Unzip_Other_Owner_1000 end');
    })
  })
}