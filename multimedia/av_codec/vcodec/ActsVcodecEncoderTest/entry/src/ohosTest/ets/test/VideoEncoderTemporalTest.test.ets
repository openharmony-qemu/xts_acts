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
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0200', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0020Test start');
      let result: number = await testNapi.VideoTemporalEncodeApi0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_API_0300', Level.LEVEL2, async () => {
      console.info('VideoTemporalEncodeApi0030Test start');
      let result: number = await testNapi.VideoTemporalEncodeApi0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0100', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0010Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0200', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0020Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0020Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0300', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0030Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0030Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0400', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0040Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0040Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_PART_FOUR_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_PART_FOUR_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_PART_FOUR_0400', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0440Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0440Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0500', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0050Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0050Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0600', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0060Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0060Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0700', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0070Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0070Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0800', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0080Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0080Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_0900', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0090Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0090Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1000', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0100Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1400', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0140Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0140Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1100', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0110Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0110Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1200', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0120Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0120Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1300', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0130Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0130Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1500', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0150Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0150Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1600', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0160Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0160Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1700', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0170Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0170Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_TEMPORAL_ENCODE_FUNCTION_1800', Level.LEVEL1, async () => {
      console.info('VideoTemporalEncodeFunction0180Test start');
      let result: number = await testNapi.VideoTemporalEncodeFunction0180Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0100', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_001Test start');
      let result: number = await testNapi.LTR_FUNC_001Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0200', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_002Test start');
      let result: number = await testNapi.LTR_FUNC_002Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0400', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_004Test start');
      let result: number = await testNapi.LTR_FUNC_004Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0500', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_005Test start');
      let result: number = await testNapi.LTR_FUNC_005Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0600', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_006Test start');
      let result: number = await testNapi.LTR_FUNC_006Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0700', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_007Test start');
      let result: number = await testNapi.LTR_FUNC_007Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0800', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_008Test start');
      let result: number = await testNapi.LTR_FUNC_008Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_0900', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_009Test start');
      let result: number = await testNapi.LTR_FUNC_009Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1000', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_010Test start');
      let result: number = await testNapi.LTR_FUNC_010Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1100', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_011Test start');
      let result: number = await testNapi.LTR_FUNC_011Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1200', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_012Test start');
      let result: number = await testNapi.LTR_FUNC_012Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1300', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_013Test start');
      let result: number = await testNapi.LTR_FUNC_013Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1400', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_014Test start');
      let result: number = await testNapi.LTR_FUNC_014Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1500', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_015Test start');
      let result: number = await testNapi.LTR_FUNC_015Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LTR_FUNC_1600', Level.LEVEL1, async () => {
      console.info('LTR_FUNC_016Test start');
      let result: number = await testNapi.LTR_FUNC_016Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100', Level.LEVEL0, async () => {
      console.info('VideoUniformlyEncodeFunction0100Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0100Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0200Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0200Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0300Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0300Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0400Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0400Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0500Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0500Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0600Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0600Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0700Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0700Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0800Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0800Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction0900Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction0900Test();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000
     * @tc.desc   func test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000', Level.LEVEL1, async () => {
      console.info('VideoUniformlyEncodeFunction1000Test start');
      let result: number = await testNapi.VideoUniformlyEncodeFunction1000Test();
      expect(result).assertEqual(0);
    });
  });
}
