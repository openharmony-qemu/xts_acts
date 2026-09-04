import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';
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

export default function VideoEncoderSetparamTest() {
  describe('VideoEncoderSetparamTest', () => {
    beforeAll(async () => {
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
          { raw: 'test.rgba', target: mediaDir + '/test.rgba' },
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
      
      testNapi.initTests();
      console.info('[beforeAll] initTests completed');
    });

    afterAll(() => {
      console.info('VideoEncoderSetparamTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderSetparamTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderSetparamTest afterEach called');
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_BITRATE_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0200', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0300', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0400', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0500', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0600', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_006Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_BITRATE_007Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0800', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_008Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_0900', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_009Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1000', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_010Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1100', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_011Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_BITRATE_1200', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_BITRATE_012Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0100', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1200', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_012Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1300', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_013Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1400', Level.LEVEL0, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_014Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_006Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_007Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_008Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_009Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_010Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_FRAMERATE_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_FRAMERATE_011Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_006Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_007Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_008Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_009Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_010Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_011Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1200', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_012Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1300', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_013Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_RESET_QP_1400', Level.LEVEL1, async () => {
      let result: number = await testNapi.RESET_QP_014Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_PROFILE_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_PROFILE_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_PROFILE_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_PROFILE_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_PROFILE_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_PROFILE_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_RANGE_FLAG_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_RANGE_FLAG_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_RANGE_FLAG_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_COLORSPACE_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_COLORSPACE_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_COLORSPACE_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_FORCE_IDR_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_SET_FORCE_IDR_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.SET_FORCE_IDR_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_006Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_003Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_004Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_005Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_006Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_007Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_008Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_009Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_010Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_011Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_COLORSPACE_CONFIG_ADD_1200', Level.LEVEL1, async () => {
      let result: number = await testNapi.COLORSPACE_CONFIG_ADD_012Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0100', Level.LEVEL0, async () => {
      let result: number = await testNapi.FRAMENUM_JUDGMENT_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_FRAMENUM_JUDGMENT_0200', Level.LEVEL0, async () => {
      let result: number = await testNapi.FRAMENUM_JUDGMENT_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0100
     * @tc.desc   setparameter lowpower camera with value 1 (HEVC+CBR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0100', Level.LEVEL1, async () => {
      let result: number = await testNapi.LOWPOWER_SETPARAM_001Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0200
     * @tc.desc   setparameter lowpower camera with value 0 (AVC+VBR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.LOWPOWER_SETPARAM_002Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0300
     * @tc.desc   setparameter lowpower camera with value -1 (HEVC+VBR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_LOWPOWER_SETPARAM_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.LOWPOWER_SETPARAM_003Test();
      expect(result).assertEqual(0);
    });
  });
}
