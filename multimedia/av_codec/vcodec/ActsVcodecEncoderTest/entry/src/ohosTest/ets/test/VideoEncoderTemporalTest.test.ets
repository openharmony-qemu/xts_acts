import hilog from '@ohos.hilog';
import testNapi from 'libvcodec_encoder_test.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function VideoEncoderTemporalTest() {
  describe('VideoEncoderTemporalTest', () => {
    beforeAll(async() => {
      console.info('VideoEncoderSetparamTest beforeAll called');
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        let mediaDir = filesDir + '/media';

        console.info(`[beforeAll] filesDir: ${filesDir}`);
        console.info(`[beforeAll] mediaDir: ${mediaDir}`);

        if (!fs.accessSync(mediaDir)) {
          fs.mkdirSync(mediaDir);
          console.info(`[beforeAll] Created directory: ${mediaDir}`);
        } else {
          console.info(`[beforeAll] Directory already exists: ${mediaDir}`);
        }

        const filesToCopy: FileCopyInfo[] = [
          { raw: '1280_720_nv.yuv', target: mediaDir + '/1280_720_nv.yuv' },
        ];

        let successCount = 0;
        let failCount = 0;

        for (const file of filesToCopy) {
          try {
            console.info(`[beforeAll] Attempting to copy: ${file.raw}`);
            await copyRawFileToSandbox(context, file.raw, file.target);
            successCount++;
            console.info(`[beforeAll] Successfully copied: ${file.raw}`);
          } catch (e) {
            failCount++;
            console.error(`[beforeAll] Failed to copy ${file.raw}: ${JSON.stringify(e)}`);
          }
        }

        console.info(`[beforeAll] File preparation completed: ${successCount} success, ${failCount} failed`);
      } catch (error) {
        console.error(`[beforeAll] Setup failed: ${JSON.stringify(error)}`);
      }
      testNapi.initTests()
    });

    afterAll(() => {
      console.info('VideoEncoderTemporalTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderTemporalTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderTemporalTest afterEach called');
    });

    /**
     * @tc.name VideoTemporalEncodeApi0020Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoTemporalEncodeApi0020Test', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0020Test start');
      let result: number = await testNapi.runTemporalTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeApi0030Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_API_0030
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoTemporalEncodeApi0030Test', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0030Test start');
      let result: number = await testNapi.runTemporalTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0010Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0010
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0010Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0010Test start');
      let result: number = await testNapi.runTemporalTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0020Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0020
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0020Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0020Test start');
      let result: number = await testNapi.runTemporalTest(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0030Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0030
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0030Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0030Test start');
      let result: number = await testNapi.runTemporalTest(4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0040Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0040Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0040Test start');
      let result: number = await testNapi.runTemporalTest(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0440Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0440
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0440Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0440Test start');
      let result: number = await testNapi.runTemporalTest(6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0050Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0050
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0050Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0050Test start');
      let result: number = await testNapi.runTemporalTest(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0060Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0060
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0060Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0060Test start');
      let result: number = await testNapi.runTemporalTest(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0070Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0070
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0070Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0070Test start');
      let result: number = await testNapi.runTemporalTest(9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0080Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0080
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0080Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0080Test start');
      let result: number = await testNapi.runTemporalTest(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0090Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0090
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0090Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0090Test start');
      let result: number = await testNapi.runTemporalTest(11);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0100Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0100Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0100Test start');
      let result: number = await testNapi.runTemporalTest(12);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0140Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0140
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0140Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0140Test start');
      let result: number = await testNapi.runTemporalTest(16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0110Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0110
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0110Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0110Test start');
      let result: number = await testNapi.runTemporalTest(13);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0120Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0120
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0120Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0120Test start');
      let result: number = await testNapi.runTemporalTest(14);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0130Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0130
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0130Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0130Test start');
      let result: number = await testNapi.runTemporalTest(15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0150Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0150
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0150Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0150Test start');
      let result: number = await testNapi.runTemporalTest(17);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0160Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0160
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0160Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0160Test start');
      let result: number = await testNapi.runTemporalTest(18);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0170Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0170
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0170Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0170Test start');
      let result: number = await testNapi.runTemporalTest(19);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoTemporalEncodeFunction0180Test
     * @tc.number VIDEO_TEMPORAL_ENCODE_FUNCTION_0180
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoTemporalEncodeFunction0180Test', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0180Test start');
      let result: number = await testNapi.runTemporalTest(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_001Test
     * @tc.number LTR_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_001Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_001Test start');
      let result: number = await testNapi.runTemporalTest(21);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_002Test
     * @tc.number LTR_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_002Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_002Test start');
      let result: number = await testNapi.runTemporalTest(22);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_004Test
     * @tc.number LTR_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_004Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_004Test start');
      let result: number = await testNapi.runTemporalTest(23);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_005Test
     * @tc.number LTR_FUNC_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_005Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_005Test start');
      let result: number = await testNapi.runTemporalTest(24);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_006Test
     * @tc.number LTR_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_006Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_006Test start');
      let result: number = await testNapi.runTemporalTest(25);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_007Test
     * @tc.number LTR_FUNC_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_007Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_007Test start');
      let result: number = await testNapi.runTemporalTest(26);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_008Test
     * @tc.number LTR_FUNC_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_008Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_008Test start');
      let result: number = await testNapi.runTemporalTest(27);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_009Test
     * @tc.number LTR_FUNC_009
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_009Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_009Test start');
      let result: number = await testNapi.runTemporalTest(28);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_010Test
     * @tc.number LTR_FUNC_010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_010Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_010Test start');
      let result: number = await testNapi.runTemporalTest(29);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_011Test
     * @tc.number LTR_FUNC_011
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_011Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_011Test start');
      let result: number = await testNapi.runTemporalTest(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_012Test
     * @tc.number LTR_FUNC_012
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_012Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_012Test start');
      let result: number = await testNapi.runTemporalTest(31);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_013Test
     * @tc.number LTR_FUNC_013
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_013Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_013Test start');
      let result: number = await testNapi.runTemporalTest(32);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_014Test
     * @tc.number LTR_FUNC_014
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_014Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_014Test start');
      let result: number = await testNapi.runTemporalTest(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_015Test
     * @tc.number LTR_FUNC_015
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_015Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_015Test start');
      let result: number = await testNapi.runTemporalTest(34);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name LTR_FUNC_016Test
     * @tc.number LTR_FUNC_016
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LTR_FUNC_016Test', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_016Test start');
      let result: number = await testNapi.runTemporalTest(35);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0100Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VideoUniformlyEncodeFunction0100Test', Level.LEVEL0, async () => {
      console.info('VideoUniformlyEncodeFunction0100Test start');
      let result: number = await testNapi.runTemporalTest(36);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0200Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0200Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0200Test start');
      let result: number = await testNapi.runTemporalTest(37);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0300Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0300Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0300Test start');
      let result: number = await testNapi.runTemporalTest(38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0400Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0400Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0400Test start');
      let result: number = await testNapi.runTemporalTest(39);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0500Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0500Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0500Test start');
      let result: number = await testNapi.runTemporalTest(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0600Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0600Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0600Test start');
      let result: number = await testNapi.runTemporalTest(41);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0700Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0700Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0700Test start');
      let result: number = await testNapi.runTemporalTest(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0800Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0800Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0800Test start');
      let result: number = await testNapi.runTemporalTest(43);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction0900Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction0900Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0900Test start');
      let result: number = await testNapi.runTemporalTest(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name VideoUniformlyEncodeFunction1000Test
     * @tc.number VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VideoUniformlyEncodeFunction1000Test', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction1000Test start');
      let result: number = await testNapi.runTemporalTest(45);
      expect(result).assertEqual(0);
    });
  });
}
