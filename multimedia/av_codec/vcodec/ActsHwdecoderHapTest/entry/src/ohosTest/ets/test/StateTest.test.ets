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

export default function StateTest() {
  describe('StateTest', () => {

    beforeAll(async () => {
      console.info('StateTest beforeAll called');
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
      console.info('StateTest afterAll called');
    });

    beforeEach(() => {
      console.info('StateTest beforeEach called');
    });

    afterEach(() => {
      console.info('StateTest afterEach called');
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0100
     * @tc.number VIDEO_HWDEC_STATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0101
     * @tc.number VIDEO_HWDEC_STATE_0101
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0101', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0101Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0200
     * @tc.number VIDEO_HWDEC_STATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0300
     * @tc.number VIDEO_HWDEC_STATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0400
     * @tc.number VIDEO_HWDEC_STATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0500
     * @tc.number VIDEO_HWDEC_STATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0600
     * @tc.number VIDEO_HWDEC_STATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0700
     * @tc.number VIDEO_HWDEC_STATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0800
     * @tc.number VIDEO_HWDEC_STATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_0900
     * @tc.number VIDEO_HWDEC_STATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1000
     * @tc.number VIDEO_HWDEC_STATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1100
     * @tc.number VIDEO_HWDEC_STATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1200
     * @tc.number VIDEO_HWDEC_STATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1300
     * @tc.number VIDEO_HWDEC_STATE_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1400
     * @tc.number VIDEO_HWDEC_STATE_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1500
     * @tc.number VIDEO_HWDEC_STATE_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1600
     * @tc.number VIDEO_HWDEC_STATE_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1700
     * @tc.number VIDEO_HWDEC_STATE_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1800
     * @tc.number VIDEO_HWDEC_STATE_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_1900
     * @tc.number VIDEO_HWDEC_STATE_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState1900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2000
     * @tc.number VIDEO_HWDEC_STATE_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2100
     * @tc.number VIDEO_HWDEC_STATE_2100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2200
     * @tc.number VIDEO_HWDEC_STATE_2200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2300
     * @tc.number VIDEO_HWDEC_STATE_2300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2400
     * @tc.number VIDEO_HWDEC_STATE_2400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2500
     * @tc.number VIDEO_HWDEC_STATE_2500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2600
     * @tc.number VIDEO_HWDEC_STATE_2600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2700
     * @tc.number VIDEO_HWDEC_STATE_2700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2800
     * @tc.number VIDEO_HWDEC_STATE_2800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_2900
     * @tc.number VIDEO_HWDEC_STATE_2900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_2900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState2900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3000
     * @tc.number VIDEO_HWDEC_STATE_3000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState3000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3100
     * @tc.number VIDEO_HWDEC_STATE_3100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState3100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3200
     * @tc.number VIDEO_HWDEC_STATE_3200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState3200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3300
     * @tc.number VIDEO_HWDEC_STATE_3300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState3300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3400
     * @tc.number VIDEO_HWDEC_STATE_3400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_STATE_3400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecState3400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3500
     * @tc.number VIDEO_HWDEC_STATE_3500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3500', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState3500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3600
     * @tc.number VIDEO_HWDEC_STATE_3600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3600', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState3600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3700
     * @tc.number VIDEO_HWDEC_STATE_3700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3700', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState3700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3800
     * @tc.number VIDEO_HWDEC_STATE_3800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3800', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState3800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_3900
     * @tc.number VIDEO_HWDEC_STATE_3900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_3900', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState3900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4000
     * @tc.number VIDEO_HWDEC_STATE_4000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4000', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState4000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4100
     * @tc.number VIDEO_HWDEC_STATE_4100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4100', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState4100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_STATE_4200
     * @tc.number VIDEO_HWDEC_STATE_4200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_STATE_4200', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecState4200Test();
      expect(result).assertEqual(0);
    });
  })
}
