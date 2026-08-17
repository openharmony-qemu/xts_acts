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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libdecoder_test.so';

const TAG = 'ActsApiTest';
const DOMAIN = 0x0001;
const TEST_SUCCESS = 0;
const TEST_FAILED = -1;

export default function actsApiTest() {
  describe('ActsApiTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder API test suite started');
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder API test suite completed');
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case started');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case completed');
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00100
     * @tc.desc    Test OH_AVCodec_GetCapability for VC1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00100', Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00100');
      let result = await testNapi.VideoVc1DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00200
     * @tc.desc    Test OH_AVCodec_GetCapabilityByCategory
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00200', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00200');
      let result = await testNapi.VideoVc1DecCapApi0002();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00300
     * @tc.desc    Test OH_AVCapability_GetVideoWidthRange
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00300', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00300');
      let result = await testNapi.VideoVc1DecCapApi0003();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00400
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00400
     * @tc.desc    Test OH_AVCapability_GetVideoSupportedPixelFormats
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00400', Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00400');
      let result = await testNapi.VideoVc1DecCapApi0004();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00500
     * @tc.desc    Test pixel format validation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00500', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00500');
      let result = await testNapi.VideoVc1DecCapApi0005();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00600
     * @tc.desc    Test OH_AVCapability_GetSupportedProfiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00600', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00600');
      let result = await testNapi.VideoVc1DecCapApi0006();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00700
     * @tc.desc    Test OH_AVCapability_GetSupportedLevelsForProfile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00700', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00700');
      let result = await testNapi.VideoVc1DecCapApi0007();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00800
     * @tc.desc    Test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00800', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_CAP_API_00800');
      let result = await testNapi.VideoVc1DecCapApi0008();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00900
     * @tc.desc    Test MSVIDEO1 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00900', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00900');
      let result = await testNapi.VideoMsvideo1DecCapApi0009();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01000
     * @tc.desc    Test WMV3 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01000', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01000');
      let result = await testNapi.VideoMsvideo1DecCapApi0010();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01100
     * @tc.desc    Test WMV3 levels for profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01100');
      let result = await testNapi.VideoMsvideo1DecCapApi0011();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01200
     * @tc.desc    Test WMV3 profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01200', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_01200');
      let result = await testNapi.VideoMsvideo1DecCapApi0012();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_00100
     * @tc.desc    Test VP8 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP8DEC_CAP_API_00100');
      let result = await testNapi.VideoVp8DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_00100
     * @tc.desc    Test VP9 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_00100');
      let result = await testNapi.VideoVp9DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_00100
     * @tc.desc    Test AV1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_00100');
      let result = await testNapi.VideoAv1DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_00100
     * @tc.desc    Test RV30 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RV30DEC_CAP_API_00100');
      let result = await testNapi.VideoRv30DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_00100
     * @tc.desc    Test RV40 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RV40DEC_CAP_API_00100');
      let result = await testNapi.VideoRv40DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_00100
     * @tc.desc    Test MJPEG decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_CAP_API_00100');
      let result = await testNapi.VideoMjpegDecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00100
     * @tc.desc    Test MSVIDEO1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_CAP_API_00100');
      let result = await testNapi.VideoMsvideo1DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_00100
     * @tc.desc    Test RAWVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_RAWVIDEODEC_CAP_API_00100');
      let result = await testNapi.VideoRawvideoDecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_00100
     * @tc.desc    Test MPEG1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MPEG1DEC_CAP_API_00100');
      let result = await testNapi.VideoMpeg1DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_00100
     * @tc.desc    Test WVC1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_00100');
      let result = await testNapi.VideoWvc1DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_00100
     * @tc.desc    Test WMV3 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WMV3DEC_CAP_API_00100');
      let result = await testNapi.VideoWmv3DecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_00100
     * @tc.desc    Test DVVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_00100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DVVIDEODEC_CAP_API_00100');
      let result = await testNapi.VideoDvvideoDecCapApi0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_01300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_01300
     * @tc.desc    Test VP9 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_01300', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_CAP_API_01300');
      let result = await testNapi.VideoVp9DecCapApi0013();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01400
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01400
     * @tc.desc    Test AV1 decoder profile and level support (part 1)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01400', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01400');
      let result = await testNapi.VideoAv1DecCapApi0014();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01500
     * @tc.desc    Test AV1 decoder profile and level support (part 2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01500', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01500');
      let result = await testNapi.VideoAv1DecCapApi0015();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_01600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_01600
     * @tc.desc    Test WVC1 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_01600', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_WVC1DEC_CAP_API_01600');
      let result = await testNapi.VideoWvc1DecCapApi0016();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01700
     * @tc.desc    Test AV1 decoder supported profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01700', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_CAP_API_01700');
      let result = await testNapi.VideoAv1DecCapApi0017();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_01800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_01800
     * @tc.desc    Obtain a list of supported capabilities and their names for the video encoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_01800', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_01800');
      let result = await testNapi.VideoEncCapApi0018();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_01900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_01900
     * @tc.desc    Obtain a list of supported capabilities and their names for the video decoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_01900', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_01900');
      let result = await testNapi.VideoDecCapApi0019();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_02000
     * @tc.name    SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_02000
     * @tc.desc    Obtain a list of supported capabilities and their names for the audio encoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_02000', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_AUDIO_ENC_CAP_API_02000');
      let result = await testNapi.VideoEncCapApi0020();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_02100
     * @tc.name    SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_02100
     * @tc.desc    Obtain a list of supported capabilities and their names for the audio decoder
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_02100', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_AUDIO_DEC_CAP_API_02100');
      let result = await testNapi.VideoDecCapApi0021();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_02200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_02200
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_02200', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_ENC_CAP_API_02200');
      let result = await testNapi.VideoEncCapApi0022();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02300
     * @tc.desc    Check the secure decoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02300', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02300');
      let result = await testNapi.VideoDecCapApi0023();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02400
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02400
     * @tc.desc    Check the mimetype decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02400', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02400');
      let result = await testNapi.VideoDecCapApi0024();
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02500
     * @tc.desc    Check the mimetype decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02500', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02500');
      let result = await testNapi.VideoDecCapApi0025();
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02600
     * @tc.desc    Check the secure decoder type is nullptr
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02600', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02600');
      let result = await testNapi.VideoDecCapApi0026();
      expect(result).assertEqual(TEST_FAILED);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02700
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02700', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02700');
      let result = await testNapi.VideoDecCapApi0027();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02800
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02800', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02800');
      let result = await testNapi.VideoDecCapApi0028();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02900
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02900', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_02900');
      let result = await testNapi.VideoDecCapApi0029();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_03000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_03000
     * @tc.desc    Check the encoder type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_03000', Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_DEC_CAP_API_03000');
      let result = await testNapi.VideoDecCapApi0030();
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}
