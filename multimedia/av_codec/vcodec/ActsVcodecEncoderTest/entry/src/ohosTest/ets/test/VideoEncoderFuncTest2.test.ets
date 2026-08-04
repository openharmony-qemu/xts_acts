import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libvcodec_encoder_test.so';

export default function VideoEncoderFuncTest2() {
  describe('VideoEncoderFuncTest2', () => {
    beforeAll(() => {
      console.info('VideoEncoderFuncTest2 beforeAll called');
      testNapi.initTests();
    });

    afterAll(() => {
      console.info('VideoEncoderFuncTest2 afterAll called');
    });

    beforeEach(() => {
      console.info('VideoEncoderFuncTest2 beforeEach called');
    });

    afterEach(() => {
      console.info('VideoEncoderFuncTest2 afterEach called');
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_5900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability5900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_6900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability6900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_7900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability7900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_CAPABILITY_8300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeCapability8300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.desc   VIDEO_ENCODE_HEVC_CAPABILITY_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability5200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability5300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_5400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability5400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_0900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability0900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_1900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability1900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2400Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2500
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2500
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2500', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2500Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2600
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2600
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2600', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2600Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2700
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2700
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2700', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2700Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2800
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2800
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2800', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2800Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2900
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2900
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_2900', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability2900Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3000
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3000
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_CAPABILITY_3000', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeHevcCapability3000Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0100
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0100
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0100', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeSetMaxFrameDelayCount0100Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0200
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0200
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0200', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeSetMaxFrameDelayCount0200Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0300
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0300
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0300', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeSetMaxFrameDelayCount0300Test();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0400
     * @tc.number SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0400
     * @tc.desc   api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AV_CODEC_VIDEO_ENCODE_HEVC_SET_MAX_FRAME_DELAY_COUNT_0400', Level.LEVEL2, async () => {
      let result: number = await testNapi.VideoEncodeSetMaxFrameDelayCount0400Test();
      expect(result).assertEqual(0);
    });
  });
}
