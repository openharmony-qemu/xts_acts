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
     * @tc.number  VIDEO_VC1DEC_CAP_API_0001
     * @tc.name    VIDEO_VC1DEC_CAP_API_0001
     * @tc.desc    Test OH_AVCodec_GetCapability for VC1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('VIDEO_VC1DEC_CAP_API_0001', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0001');
      let result = testNapi.apitest(0);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0002
     * @tc.name    VIDEO_VC1DEC_CAP_API_0002
     * @tc.desc    Test OH_AVCodec_GetCapabilityByCategory
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0002', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0002');
      let result = testNapi.apitest(1);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0003
     * @tc.name    VIDEO_VC1DEC_CAP_API_0003
     * @tc.desc    Test OH_AVCapability_GetVideoWidthRange
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0003', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0003');
      let result = testNapi.apitest(2);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0004
     * @tc.name    VIDEO_VC1DEC_CAP_API_0004
     * @tc.desc    Test OH_AVCapability_GetVideoSupportedPixelFormats
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('VIDEO_VC1DEC_CAP_API_0004', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0004');
      let result = testNapi.apitest(3);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0005
     * @tc.name    VIDEO_VC1DEC_CAP_API_0005
     * @tc.desc    Test pixel format validation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0005', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0005');
      let result = testNapi.apitest(4);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0006
     * @tc.name    VIDEO_VC1DEC_CAP_API_0006
     * @tc.desc    Test OH_AVCapability_GetSupportedProfiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0006', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0006');
      let result = testNapi.apitest(5);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0007
     * @tc.name    VIDEO_VC1DEC_CAP_API_0007
     * @tc.desc    Test OH_AVCapability_GetSupportedLevelsForProfile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0007', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0007');
      let result = testNapi.apitest(6);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0008
     * @tc.name    VIDEO_VC1DEC_CAP_API_0008
     * @tc.desc    Test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0008', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0008');
      let result = testNapi.apitest(7);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0009
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0009
     * @tc.desc    Test MSVIDEO1 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0009', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0009');
      let result = testNapi.apitest(8);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0010
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0010
     * @tc.desc    Test WMV3 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0010', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0010');
      let result = testNapi.apitest(9);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0011
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0011
     * @tc.desc    Test WMV3 levels for profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0011', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0011');
      let result = testNapi.apitest(10);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0012
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0012
     * @tc.desc    Test WMV3 profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0012', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0012');
      let result = testNapi.apitest(11);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP8DEC_CAP_API_0001
     * @tc.name    VIDEO_VP8DEC_CAP_API_0001
     * @tc.desc    Test VP8 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VP8DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP8DEC_CAP_API_0001');
      let result = testNapi.apitest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_CAP_API_0001
     * @tc.name    VIDEO_VP9DEC_CAP_API_0001
     * @tc.desc    Test VP9 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VP9DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_CAP_API_0001');
      let result = testNapi.apitest(13);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_CAP_API_0001
     * @tc.name    VIDEO_AV1DEC_CAP_API_0001
     * @tc.desc    Test AV1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_AV1DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_CAP_API_0001');
      let result = testNapi.apitest(14);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_RV30DEC_CAP_API_0001
     * @tc.name    VIDEO_RV30DEC_CAP_API_0001
     * @tc.desc    Test RV30 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_RV30DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_RV30DEC_CAP_API_0001');
      let result = testNapi.apitest(15);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_RV40DEC_CAP_API_0001
     * @tc.name    VIDEO_RV40DEC_CAP_API_0001
     * @tc.desc    Test RV40 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_RV40DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_RV40DEC_CAP_API_0001');
      let result = testNapi.apitest(16);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MJPEGDEC_CAP_API_0001
     * @tc.name    VIDEO_MJPEGDEC_CAP_API_0001
     * @tc.desc    Test MJPEG decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MJPEGDEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MJPEGDEC_CAP_API_0001');
      let result = testNapi.apitest(17);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0001
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0001
     * @tc.desc    Test MSVIDEO1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0001');
      let result = testNapi.apitest(18);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_RAWVIDEODEC_CAP_API_0001
     * @tc.name    VIDEO_RAWVIDEODEC_CAP_API_0001
     * @tc.desc    Test RAWVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_RAWVIDEODEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_RAWVIDEODEC_CAP_API_0001');
      let result = testNapi.apitest(19);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MPEG1DEC_CAP_API_0001
     * @tc.name    VIDEO_MPEG1DEC_CAP_API_0001
     * @tc.desc    Test MPEG1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MPEG1DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MPEG1DEC_CAP_API_0001');
      let result = testNapi.apitest(20);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_WVC1DEC_CAP_API_0001
     * @tc.name    VIDEO_WVC1DEC_CAP_API_0001
     * @tc.desc    Test WVC1 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_WVC1DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_WVC1DEC_CAP_API_0001');
      let result = testNapi.apitest(21);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_WMV3DEC_CAP_API_0001
     * @tc.name    VIDEO_WMV3DEC_CAP_API_0001
     * @tc.desc    Test WMV3 decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_WMV3DEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_WMV3DEC_CAP_API_0001');
      let result = testNapi.apitest(22);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_DVVIDEODEC_CAP_API_0001
     * @tc.name    VIDEO_DVVIDEODEC_CAP_API_0001
     * @tc.desc    Test DVVIDEO decoder capability API
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_DVVIDEODEC_CAP_API_0001', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_DVVIDEODEC_CAP_API_0001');
      let result = testNapi.apitest(23);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_CAP_API_0013
     * @tc.name    VIDEO_VP9DEC_CAP_API_0013
     * @tc.desc    Test VP9 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VP9DEC_CAP_API_0013', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_CAP_API_0013');
      let result = testNapi.apitest(24);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_CAP_API_0014
     * @tc.name    VIDEO_AV1DEC_CAP_API_0014
     * @tc.desc    Test AV1 decoder profile and level support (part 1)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_AV1DEC_CAP_API_0014', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_CAP_API_0014');
      let result = testNapi.apitest(25);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_CAP_API_0015
     * @tc.name    VIDEO_AV1DEC_CAP_API_0015
     * @tc.desc    Test AV1 decoder profile and level support (part 2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_AV1DEC_CAP_API_0015', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_CAP_API_0015');
      let result = testNapi.apitest(26);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_WVC1DEC_CAP_API_0016
     * @tc.name    VIDEO_WVC1DEC_CAP_API_0016
     * @tc.desc    Test WVC1 decoder profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_WVC1DEC_CAP_API_0016', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_WVC1DEC_CAP_API_0016');
      let result = testNapi.apitest(27);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_CAP_API_0017
     * @tc.name    VIDEO_AV1DEC_CAP_API_0017
     * @tc.desc    Test AV1 decoder supported profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_AV1DEC_CAP_API_0017', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_CAP_API_0017');
      let result = testNapi.apitest(28);
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}
