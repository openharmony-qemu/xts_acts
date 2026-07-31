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

export default function FuncTest() {
  describe('FuncTest', () => {

    beforeAll(async () => {
      console.info('FuncTest beforeAll called');
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
      console.info('FuncTest afterAll called');
    });

    beforeEach(() => {
      console.info('FuncTest beforeEach called');
    });

    afterEach(() => {
      console.info('FuncTest afterEach called');
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0200
     * @tc.number VIDEO_HWDEC_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0300
     * @tc.number VIDEO_HWDEC_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FUNCTION_0300', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoHwdecFunction0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0400
     * @tc.number VIDEO_HWDEC_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_HWDEC_FUNCTION_0400', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoHwdecFunction0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0700
     * @tc.number VIDEO_HWDEC_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecFunction0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0800
     * @tc.number VIDEO_HWDEC_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecFunction0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_0900
     * @tc.number VIDEO_HWDEC_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecFunction0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1000
     * @tc.number VIDEO_HWDEC_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecFunction1000Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1100
     * @tc.number VIDEO_HWDEC_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_FUNCTION_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecFunction1100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1200
     * @tc.number VIDEO_HWDEC_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction1200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1300
     * @tc.number VIDEO_HWDEC_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction1300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1400
     * @tc.number VIDEO_HWDEC_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction1400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1600
     * @tc.number VIDEO_HWDEC_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction1600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_FUNCTION_1700
     * @tc.number VIDEO_HWDEC_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_HWDEC_FUNCTION_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoHwdecFunction1700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SURF_CHANGE_FUNC_001
     * @tc.number SURF_CHANGE_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_001', Level.LEVEL0, async () => {
      let result: number = await testNapi.SurfChangeFunc001Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SURF_CHANGE_FUNC_002
     * @tc.number SURF_CHANGE_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_002', Level.LEVEL0, async () => {
      let result: number = await testNapi.SurfChangeFunc002Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SURF_CHANGE_FUNC_003
     * @tc.number SURF_CHANGE_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_003', Level.LEVEL0, async () => {
      let result: number = await testNapi.SurfChangeFunc003Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SURF_CHANGE_FUNC_004
     * @tc.number SURF_CHANGE_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SURF_CHANGE_FUNC_004', Level.LEVEL0, async () => {
      let result: number = await testNapi.SurfChangeFunc004Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_001
     * @tc.number OUTPUT_DECS_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_001', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc001Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_002
     * @tc.number OUTPUT_DECS_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_002', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc002Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_003
     * @tc.number OUTPUT_DECS_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_003', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc003Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_004
     * @tc.number OUTPUT_DECS_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_004', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc004Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_005
     * @tc.number OUTPUT_DECS_FUNC_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_005', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc005Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_006
     * @tc.number OUTPUT_DECS_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_006', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc006Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   OUTPUT_DECS_FUNC_007
     * @tc.number OUTPUT_DECS_FUNC_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OUTPUT_DECS_FUNC_007', Level.LEVEL0, async () => {
      let result: number = await testNapi.OutputDecsFunc007Test();
      expect(result).assertEqual(0);
    });
  })
}
