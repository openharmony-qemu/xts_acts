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

export default function Func2Test() {
  describe('Func2Test', () => {
    beforeAll(async () => {
      console.info('Func2Test beforeAll called');
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
      console.info('Func2Test afterAll called');
    });

    beforeEach(() => {
      console.info('Func2Test beforeEach called');
    });

    afterEach(() => {
      console.info('Func2Test afterEach called');
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0030
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0030', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0040', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0050
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0050
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0050', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0050Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0060
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0060
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0060', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0060Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0070
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0070
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0070', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0070Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0080
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0080
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0080', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0080Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0090
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0090
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0090', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0090Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0100
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0110
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0110
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0110', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0110Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0120
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0120
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_FUNC_0120', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0120Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0130
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0130
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_FUNC_0130', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0130Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0140
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0140
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_FUNC_0140', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0140Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0150
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0150
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_FUNC_0150', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0150Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0160
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0160
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0160', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0160Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_FUNC_0170
     * @tc.number VIDEO_DECODE_SYNC_FUNC_0170
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_FUNC_0170', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncFunc0170Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_HW264_FUNC_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw264Func0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW264_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_HW264_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_HW264_FUNC_0020', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw264Func0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_HW265_FUNC_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw265Func0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_HW265_FUNC_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw265Func0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW265_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_HW265_FUNC_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_HW265_FUNC_0040', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw265Func0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_HW266_FUNC_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw266Func0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_HW266_FUNC_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw266Func0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW266_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_HW266_FUNC_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_HW266_FUNC_0040', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw266Func0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw264LowlatencyFunc0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw265LowlatencyFunc0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeSyncHw266LowlatencyFunc0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_H264_BLANK_FRAME_0010
     * @tc.number VIDEO_DECODE_H264_BLANK_FRAME_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_H264_BLANK_FRAME_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeH264BlankFrame0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_H265_BLANK_FRAME_0020
     * @tc.number VIDEO_DECODE_H265_BLANK_FRAME_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_H265_BLANK_FRAME_0020', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeH265BlankFrame0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_H266_BLANK_FRAME_0030
     * @tc.number VIDEO_DECODE_H266_BLANK_FRAME_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_H266_BLANK_FRAME_0030', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeH266BlankFrame0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0001
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0001', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0001Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0002
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_LOW_LATENCY_0002', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0002Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0003
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0003', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0003Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0004
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0004', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0004Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0005
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0005', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0005Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0006
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0006', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0006Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0007
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0007', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0007Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0008
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0008', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0008Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_LOW_LATENCY_0009
     * @tc.number VIDEO_DECODE_LOW_LATENCY_0009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_LOW_LATENCY_0009', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeLowLatency0009Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_HWDEC_PIXE_FORMAT_0030
     * @tc.number VIDEO_HWDEC_PIXE_FORMAT_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_HWDEC_PIXE_FORMAT_0030', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoHwdecPixeFormat0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_TRANSFORM_0010
     * @tc.number VIDEO_DECODE_TRANSFORM_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_TRANSFORM_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeTransform0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_TRANSFORM_0020
     * @tc.number VIDEO_DECODE_TRANSFORM_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_TRANSFORM_0020', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeTransform0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_RESOLUTION_0010
     * @tc.number VIDEO_DECODE_RESOLUTION_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_RESOLUTION_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeResolution0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_ANOTHER_0010
     * @tc.number VIDEO_DECODE_ANOTHER_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_DECODE_ANOTHER_0010', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeAnother0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_CAPABILITY_CONFIG_0010
     * @tc.number VIDEO_CAPABILITY_CONFIG_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_CAPABILITY_CONFIG_0010', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoCapabilityConfig0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_CAPABILITY_CONFIG_0020
     * @tc.number VIDEO_CAPABILITY_CONFIG_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_CAPABILITY_CONFIG_0020', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoCapabilityConfig0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_CAPABILITY_CONFIG_0030
     * @tc.number VIDEO_CAPABILITY_CONFIG_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_CAPABILITY_CONFIG_0030', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoCapabilityConfig0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_MEDIA_VIDEO_DECODE_ORDER_0100
     * @tc.number SUB_MEDIA_VIDEO_DECODE_ORDER_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_VIDEO_DECODE_ORDER_0100', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeOrder0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_MEDIA_VIDEO_DECODE_ORDER_0200
     * @tc.number SUB_MEDIA_VIDEO_DECODE_ORDER_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_VIDEO_DECODE_ORDER_0200', Level.LEVEL0, async () => {
      let result: number = await testNapi.VideoDecodeOrder0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_MEDIA_VIDEO_DECODE_ORDER_0300
     * @tc.number SUB_MEDIA_VIDEO_DECODE_ORDER_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_VIDEO_DECODE_ORDER_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeOrder0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_MEDIA_VIDEO_DECODE_ORDER_0400
     * @tc.number SUB_MEDIA_VIDEO_DECODE_ORDER_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_VIDEO_DECODE_ORDER_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeOrder0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_MEDIA_VIDEO_DECODE_ORDER_0500
     * @tc.number SUB_MEDIA_VIDEO_DECODE_ORDER_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_VIDEO_DECODE_ORDER_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoDecodeOrder0500Test();
      expect(result).assertEqual(0);
    });

  })
}
