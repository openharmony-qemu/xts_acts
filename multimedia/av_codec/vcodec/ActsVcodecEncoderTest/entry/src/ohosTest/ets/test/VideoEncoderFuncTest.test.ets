import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';
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

export default function VideoEncoderFuncTest() {
  describe('VideoEncoderFuncTest', () => {
    beforeAll(async () => {
      console.info('VideoEncoderFuncTest beforeAll called');
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
      console.info('VideoEncoderFuncTest afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderFuncTest beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderFuncTest afterEach called');
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeFunction0100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0200', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0300', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0400', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0500', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0600', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0700', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_PART_TWO_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_PART_TWO_0800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_PART_TWO_0800', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0810Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_0900', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction0900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1000', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1100', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1400', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1600', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1700', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1800', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_1900', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction1900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_2000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_2000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_FUNCTION_2000', Level.LEVEL1, async () => {
      let result: number = await testNapi.VideoEncodeFunction2000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability9900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability0900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_PART_TWO_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1310Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1500
     * @tc.desc   VIDEO_ENCODE_CAPABILITY_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability1900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability2800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_3900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability3900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_4900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability4900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_9800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability9800Test();
      expect(result).assertEqual(0);
    });
  });
}