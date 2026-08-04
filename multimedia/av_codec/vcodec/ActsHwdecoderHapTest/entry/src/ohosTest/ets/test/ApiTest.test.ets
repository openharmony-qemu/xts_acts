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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

interface FileCopyInfo {
  raw: string;
  target: string;
}

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

async function copyRawFileToSandbox(context: Context, rawFileName: string, targetPath: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    context.resourceManager.getRawFileContent(rawFileName, (error, buffer) => {
      if (error) {
        console.error(`[copyRawFile] ${rawFileName} copy failed: ${error.code}, message: ${error.message}`);
        reject(error);
      } else {
        try {
          let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, buffer.buffer);
          fs.closeSync(file);
          console.info(`[copyRawFile] ${rawFileName} copy success to ${targetPath}`);
          resolve();
        } catch (e) {
          console.error(`[copyRawFile] ${rawFileName} write failed: ${JSON.stringify(e)}`);
          reject(e);
        }
      }
    });
  });
}

export default function ApiTest() {
  describe('ApiTest', () => {
    beforeAll(async () => {
      console.info('ApiTest beforeAll called');
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        let mediaDir = filesDir + '/media';
        if (!fs.accessSync(mediaDir)) {
          fs.mkdirSync(mediaDir);
        }
      } catch (error) {
        console.error(`[beforeAll] Setup failed: ${JSON.stringify(error)}`);
      }
      testNapi.initTests();
      console.info('[beforeAll] initTests completed');
    });

    afterAll(() => {
      console.info('ApiTest afterAll called');
    });

    beforeEach(() => {
      console.info('ApiTest beforeEach called');
    });

    afterEach(() => {
      console.info('ApiTest afterEach called');
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara3300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0400
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1400
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_5000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_5000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara5000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_5100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_5100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara5100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0900
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_4100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_4100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara4100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1300
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara1700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2500
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2600
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2700
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2800
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2900
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_2900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara2900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3000
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara3000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3100
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara3100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3200
     * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_ILLEGAL_PARA_3200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecIllegalPara3200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0100
     * @tc.number VIDEO_HWDEC_API_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0200
     * @tc.number VIDEO_HWDEC_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0300
     * @tc.number VIDEO_HWDEC_API_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0400
     * @tc.number VIDEO_HWDEC_API_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0500
     * @tc.number VIDEO_HWDEC_API_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0600
     * @tc.number VIDEO_HWDEC_API_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0700
     * @tc.number VIDEO_HWDEC_API_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0800
     * @tc.number VIDEO_HWDEC_API_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_0900
     * @tc.number VIDEO_HWDEC_API_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_1000
     * @tc.number VIDEO_HWDEC_API_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi1000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_1100
     * @tc.number VIDEO_HWDEC_API_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi1100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_1200
     * @tc.number VIDEO_HWDEC_API_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApi1200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0100
     * @tc.number VIDEO_HWDEC_CAP_API_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0200
     * @tc.number VIDEO_HWDEC_CAP_API_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0300
     * @tc.number VIDEO_HWDEC_CAP_API_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0400
     * @tc.number VIDEO_HWDEC_CAP_API_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0500
     * @tc.number VIDEO_HWDEC_CAP_API_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0600
     * @tc.number VIDEO_HWDEC_CAP_API_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0700
     * @tc.number VIDEO_HWDEC_CAP_API_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0800
     * @tc.number VIDEO_HWDEC_CAP_API_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_0900
     * @tc.number VIDEO_HWDEC_CAP_API_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1000
     * @tc.number VIDEO_HWDEC_CAP_API_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3100
     * @tc.number VIDEO_HWDEC_CAP_API_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3200
     * @tc.number VIDEO_HWDEC_CAP_API_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3300
     * @tc.number VIDEO_HWDEC_CAP_API_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3400
     * @tc.number VIDEO_HWDEC_CAP_API_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3500
     * @tc.number VIDEO_HWDEC_CAP_API_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3600
     * @tc.number VIDEO_HWDEC_CAP_API_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3700
     * @tc.number VIDEO_HWDEC_CAP_API_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3800
     * @tc.number VIDEO_HWDEC_CAP_API_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_3900
     * @tc.number VIDEO_HWDEC_CAP_API_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_3900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi3900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4000
     * @tc.number VIDEO_HWDEC_CAP_API_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4100
     * @tc.number VIDEO_HWDEC_CAP_API_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4200
     * @tc.number VIDEO_HWDEC_CAP_API_4200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4300
     * @tc.number VIDEO_HWDEC_CAP_API_4300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4400
     * @tc.number VIDEO_HWDEC_CAP_API_4400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4500
     * @tc.number VIDEO_HWDEC_CAP_API_4500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4600
     * @tc.number VIDEO_HWDEC_CAP_API_4600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4700
     * @tc.number VIDEO_HWDEC_CAP_API_4700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4800
     * @tc.number VIDEO_HWDEC_CAP_API_4800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_4900
     * @tc.number VIDEO_HWDEC_CAP_API_4900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_4900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi4900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5000
     * @tc.number VIDEO_HWDEC_CAP_API_5000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1700
     * @tc.number VIDEO_HWDEC_CAP_API_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5100
     * @tc.number VIDEO_HWDEC_CAP_API_5100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5200
     * @tc.number VIDEO_HWDEC_CAP_API_5200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5300
     * @tc.number VIDEO_HWDEC_CAP_API_5300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_9400
     * @tc.number VIDEO_HWDEC_CAP_API_9400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_9400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi9400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5400
     * @tc.number VIDEO_HWDEC_CAP_API_5400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5500
     * @tc.number VIDEO_HWDEC_CAP_API_5500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5600
     * @tc.number VIDEO_HWDEC_CAP_API_5600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5700
     * @tc.number VIDEO_HWDEC_CAP_API_5700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1600
     * @tc.number VIDEO_HWDEC_CAP_API_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5800
     * @tc.number VIDEO_HWDEC_CAP_API_5800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_5900
     * @tc.number VIDEO_HWDEC_CAP_API_5900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_5900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi5900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6000
     * @tc.number VIDEO_HWDEC_CAP_API_6000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6100
     * @tc.number VIDEO_HWDEC_CAP_API_6100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6200
     * @tc.number VIDEO_HWDEC_CAP_API_6200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6300
     * @tc.number VIDEO_HWDEC_CAP_API_6300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6400
     * @tc.number VIDEO_HWDEC_CAP_API_6400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6500
     * @tc.number VIDEO_HWDEC_CAP_API_6500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6600
     * @tc.number VIDEO_HWDEC_CAP_API_6600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6700
     * @tc.number VIDEO_HWDEC_CAP_API_6700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6800
     * @tc.number VIDEO_HWDEC_CAP_API_6800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_6900
     * @tc.number VIDEO_HWDEC_CAP_API_6900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_6900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi6900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7000
     * @tc.number VIDEO_HWDEC_CAP_API_7000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7100
     * @tc.number VIDEO_HWDEC_CAP_API_7100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1200
     * @tc.number VIDEO_HWDEC_CAP_API_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7200
     * @tc.number VIDEO_HWDEC_CAP_API_7200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7300
     * @tc.number VIDEO_HWDEC_CAP_API_7300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7400
     * @tc.number VIDEO_HWDEC_CAP_API_7400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7500
     * @tc.number VIDEO_HWDEC_CAP_API_7500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1300
     * @tc.number VIDEO_HWDEC_CAP_API_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7600
     * @tc.number VIDEO_HWDEC_CAP_API_7600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7700
     * @tc.number VIDEO_HWDEC_CAP_API_7700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7800
     * @tc.number VIDEO_HWDEC_CAP_API_7800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_7900
     * @tc.number VIDEO_HWDEC_CAP_API_7900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_7900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi7900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8000
     * @tc.number VIDEO_HWDEC_CAP_API_8000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi8000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_1400
     * @tc.number VIDEO_HWDEC_CAP_API_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi1400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8100
     * @tc.number VIDEO_HWDEC_CAP_API_8100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi8100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8200
     * @tc.number VIDEO_HWDEC_CAP_API_8200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi8200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_CAP_API_8300
     * @tc.number VIDEO_HWDEC_CAP_API_8300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_CAP_API_8300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecCapApi8300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_ATTIME_API_0010
     * @tc.number VIDEO_HWDEC_ATTIME_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_ATTIME_API_0010', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecAttimeApi0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0010
     * @tc.number VIDEO_DECODE_SYNC_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0020
     * @tc.number VIDEO_DECODE_SYNC_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0030
     * @tc.number VIDEO_DECODE_SYNC_API_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0030', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0040
     * @tc.number VIDEO_DECODE_SYNC_API_0040
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0040', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0050
     * @tc.number VIDEO_DECODE_SYNC_API_0050
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0050', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0050Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0060
     * @tc.number VIDEO_DECODE_SYNC_API_0060
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0060', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0060Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0070
     * @tc.number VIDEO_DECODE_SYNC_API_0070
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0070', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0070Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_API_0080
     * @tc.number VIDEO_DECODE_SYNC_API_0080
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_API_0080', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncApi0080Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FORMAT_API_0010
     * @tc.number VIDEO_HWDEC_FORMAT_API_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FORMAT_API_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoHwdecFormatApi0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FORMAT_API_0020
     * @tc.number VIDEO_HWDEC_FORMAT_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FORMAT_API_0020', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoHwdecFormatApi0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0010
     * @tc.number VIDEO_HWDEC_API_ADD_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0020
     * @tc.number VIDEO_HWDEC_API_ADD_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0030
     * @tc.number VIDEO_HWDEC_API_ADD_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0030', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_API_ADD_0040
     * @tc.number VIDEO_HWDEC_API_ADD_0040
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_API_ADD_0040', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1000
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0050Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1100
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0060Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1200
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0070Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1300
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0080Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1400
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0090Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_VIDEO_HWDEC_API_ADD_1500
     * @tc.number SUB_VIDEO_HWDEC_API_ADD_1500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_HWDEC_API_ADD_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecApiAdd0100Test();
      expect(result).assertEqual(0);
    });
  })
}