import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libSwdecoderTest from 'libswdecoder_test.so';

export default function ActsApiTest() {
  describe('ActsApiTest', () => {
    beforeAll(() => {
      libSwdecoderTest.initTests();
    });
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    // SwdecApiIllegalParaTest: 30 cases
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3300
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara3300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0300
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0400
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1400
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_5000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_5000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_5000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara5000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_5100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_5100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_5100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara5100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_0900
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara0900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_4100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_4100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_4100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara4100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_1700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_1700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_1700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara1700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2500
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2600
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2700
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2800
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_2900
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_2900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_2900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara2900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3000
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara3000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3100
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara3100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_ILLEGAL_PARA_3200
     * @tc.number VIDEO_SWDEC_ILLEGAL_PARA_3200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_ILLEGAL_PARA_3200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecIllegalPara3200();
      expect(result).assertEqual(0);
    });

    // SwdecApiTest: 12 cases
    /**
     * @tc.name   VIDEO_SWDEC_API_0100
     * @tc.number VIDEO_SWDEC_API_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0200
     * @tc.number VIDEO_SWDEC_API_0200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0300
     * @tc.number VIDEO_SWDEC_API_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0400
     * @tc.number VIDEO_SWDEC_API_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0500
     * @tc.number VIDEO_SWDEC_API_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0600
     * @tc.number VIDEO_SWDEC_API_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0700
     * @tc.number VIDEO_SWDEC_API_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0800
     * @tc.number VIDEO_SWDEC_API_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_0900
     * @tc.number VIDEO_SWDEC_API_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi0900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1000
     * @tc.number VIDEO_SWDEC_API_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi1000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1100
     * @tc.number VIDEO_SWDEC_API_1100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi1100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_API_1200
     * @tc.number VIDEO_SWDEC_API_1200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_API_1200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecApi1200();
      expect(result).assertEqual(0);
    });

    // SwdecCapApiTest: 51 cases
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0100
     * @tc.number VIDEO_SWDEC_CAP_API_0100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0300
     * @tc.number VIDEO_SWDEC_CAP_API_0300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0400
     * @tc.number VIDEO_SWDEC_CAP_API_0400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0500
     * @tc.number VIDEO_SWDEC_CAP_API_0500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0600
     * @tc.number VIDEO_SWDEC_CAP_API_0600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0700
     * @tc.number VIDEO_SWDEC_CAP_API_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0800
     * @tc.number VIDEO_SWDEC_CAP_API_0800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_0900
     * @tc.number VIDEO_SWDEC_CAP_API_0900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_0900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi0900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_1000
     * @tc.number VIDEO_SWDEC_CAP_API_1000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_1000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi1000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3100
     * @tc.number VIDEO_SWDEC_CAP_API_3100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3200
     * @tc.number VIDEO_SWDEC_CAP_API_3200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3300
     * @tc.number VIDEO_SWDEC_CAP_API_3300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3400
     * @tc.number VIDEO_SWDEC_CAP_API_3400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3500
     * @tc.number VIDEO_SWDEC_CAP_API_3500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3600
     * @tc.number VIDEO_SWDEC_CAP_API_3600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3700
     * @tc.number VIDEO_SWDEC_CAP_API_3700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3800
     * @tc.number VIDEO_SWDEC_CAP_API_3800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_3900
     * @tc.number VIDEO_SWDEC_CAP_API_3900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_3900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi3900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4000
     * @tc.number VIDEO_SWDEC_CAP_API_4000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4100
     * @tc.number VIDEO_SWDEC_CAP_API_4100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4200
     * @tc.number VIDEO_SWDEC_CAP_API_4200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4300
     * @tc.number VIDEO_SWDEC_CAP_API_4300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4400
     * @tc.number VIDEO_SWDEC_CAP_API_4400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4500
     * @tc.number VIDEO_SWDEC_CAP_API_4500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4600
     * @tc.number VIDEO_SWDEC_CAP_API_4600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4700
     * @tc.number VIDEO_SWDEC_CAP_API_4700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4800
     * @tc.number VIDEO_SWDEC_CAP_API_4800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_4900
     * @tc.number VIDEO_SWDEC_CAP_API_4900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_4900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi4900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5000
     * @tc.number VIDEO_SWDEC_CAP_API_5000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5100
     * @tc.number VIDEO_SWDEC_CAP_API_5100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5200
     * @tc.number VIDEO_SWDEC_CAP_API_5200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5300
     * @tc.number VIDEO_SWDEC_CAP_API_5300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_9400
     * @tc.number VIDEO_SWDEC_CAP_API_9400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_9400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi9400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5400
     * @tc.number VIDEO_SWDEC_CAP_API_5400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5500
     * @tc.number VIDEO_SWDEC_CAP_API_5500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5600
     * @tc.number VIDEO_SWDEC_CAP_API_5600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5700
     * @tc.number VIDEO_SWDEC_CAP_API_5700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5800
     * @tc.number VIDEO_SWDEC_CAP_API_5800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_5900
     * @tc.number VIDEO_SWDEC_CAP_API_5900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_5900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi5900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6000
     * @tc.number VIDEO_SWDEC_CAP_API_6000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6100
     * @tc.number VIDEO_SWDEC_CAP_API_6100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6100();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6200
     * @tc.number VIDEO_SWDEC_CAP_API_6200
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6200', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6200();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6300
     * @tc.number VIDEO_SWDEC_CAP_API_6300
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6300', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6300();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6400
     * @tc.number VIDEO_SWDEC_CAP_API_6400
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6400', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6400();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6500
     * @tc.number VIDEO_SWDEC_CAP_API_6500
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6500', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6500();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6600
     * @tc.number VIDEO_SWDEC_CAP_API_6600
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6600', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6600();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6700
     * @tc.number VIDEO_SWDEC_CAP_API_6700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6800
     * @tc.number VIDEO_SWDEC_CAP_API_6800
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6800', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6800();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_6900
     * @tc.number VIDEO_SWDEC_CAP_API_6900
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_6900', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi6900();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_7000
     * @tc.number VIDEO_SWDEC_CAP_API_7000
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_7000', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi7000();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_SWDEC_CAP_API_7100
     * @tc.number VIDEO_SWDEC_CAP_API_7100
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_SWDEC_CAP_API_7100', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoSwdecCapApi7100();
      expect(result).assertEqual(0);
    });

    // SwdecOtherCodecIllegalTest: 3 cases
    /**
     * @tc.name   VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_MPEG2SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoMpeg2SwdecIllegalPara0700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_MPEG4SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoMpeg4SwdecIllegalPara0700();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   VIDEO_H263SWDEC_ILLEGAL_PARA_0700
     * @tc.number VIDEO_H263SWDEC_ILLEGAL_PARA_0700
     * @tc.desc   api test
     * @tc.type   API
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VIDEO_H263SWDEC_ILLEGAL_PARA_0700', Level.LEVEL2, async () => {
      const result = await libSwdecoderTest.VideoH263SwdecIllegalPara0700();
      expect(result).assertEqual(0);
    });
  });
}
