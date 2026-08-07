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
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = 'ActsFuncTest';
const DOMAIN = 0x0001;
const TEST_SUCCESS = 0;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

export default function actsFuncTest() {
  describe('ActsFuncTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'Video Decoder function test suite started');
      
      let context = getContext();
      let dir = context.filesDir + "/";
      
      const videoFiles = [
        "test_vc1.avi",
        "1920_1080_30.avi",
        "msvideo1_720x480.avi",
        "vp8_480x640.ivf",
        "vp9_1_0_p0_256x144@15fps.ivf",
        "vp9_1_1_p1_384x192@30fps.ivf",
        "vp9_2_1_p2_640x384@30fps.ivf",
        "vp9_3_1_p3_1280x768@30fps.ivf",
        "vp9_4_0_p0_2048x1088@30fps.ivf",
        "vp9_4_0_p1_2048x1088@30fps.ivf",
        "av1_main_L3.1_1280x720.ivf",
        "av1_main_L4.0_1920x1080.ivf",
        "av1_high_L3.0_854x480.ivf",
        "av1_high_L4.0_1920x1080.ivf",
        "cinepak_720_480_25.mkv"
      ];
      
      let videoDir = dir + "video";
      if (!fs.accessSync(videoDir)) {
        fs.mkdirSync(videoDir);
        hilog.info(DOMAIN, TAG, 'Created video directory: %{public}s', videoDir);
      }
      
      let successCount = 0;
      let failCount = 0;
      
      for (let fileName of videoFiles) {
        try {
          let targetPath = videoDir + "/" + fileName;
          await new Promise<void>((resolve, reject) => {
            context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
              if (error) {
                hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] %{public}s copy failed: %{public}d, message: %{public}s',
                  fileName, error.code, error.message);
                reject(error);
              } else {
                let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                fs.writeSync(file.fd, model_buffer.buffer);
                fs.closeSync(file);
                hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] %{public}s copy success', fileName);
                resolve();
              }
            });
          });
          successCount++;
        } catch (error) {
          failCount++;
          hilog.error(DOMAIN, TAG,
            '[rawfile_copy_to_sandbox] %{public}s copy exception: %{public}s',
            fileName, JSON.stringify(error));
        }
      }
      
      hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] sandbox path: %{public}s', dir);
      hilog.info(DOMAIN, TAG,
        '[rawfile_copy_to_sandbox] Copy completed: %{public}d success, %{public}d failed, total %{public}d files',
        successCount, failCount, videoFiles.length);
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder function test suite completed');
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case started');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case completed');
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00100
     * @tc.desc    Test VC1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00100', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00100');
      let result = await testNapi.VideoVc1DecFunction0001();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00300
     * @tc.desc    Test MJPEG decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00300', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00300');
      let result = await testNapi.VideoMjpegDecFunction0003();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00500
     * @tc.desc    Test MSVIDEO1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00500', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00500');
      let result = await testNapi.VideoMsvideo1DecFunction0005();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00200
     * @tc.desc    Test VC1 decoder with surf mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00200', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VC1DEC_FUNCTION_00200');
      let result = await testNapi.VideoVc1DecFunction0002();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00400
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00400
     * @tc.desc    Test MJPEG decoder with surf mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00400', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MJPEGDEC_FUNCTION_00400');
      let result = await testNapi.VideoMjpegDecFunction0004();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00600
     * @tc.desc    Test MSVIDEO1 decoder with surf mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00600', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_MSVIDEO1DEC_FUNCTION_00600');
      let result = await testNapi.VideoMsvideo1DecFunction0006();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_00700
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_00700
     * @tc.desc    Test VP8 decoder function
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_00700', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_00700');
      let result = await testNapi.VideoVp8DecFunction0007();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00800
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00800
     * @tc.desc    Test VP9 decoder function with profile 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00800', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00800');
      let result = await testNapi.VideoVp9DecFunction0008();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00900
     * @tc.desc    Test VP9 decoder function with profile 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00900', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_00900');
      let result = await testNapi.VideoVp9DecFunction0009();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01000
     * @tc.desc    Test VP9 decoder function with profile 2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01000', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01000');
      let result = await testNapi.VideoVp9DecFunction0010();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01100
     * @tc.desc    Test VP9 decoder function with profile 3
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01100', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01100');
      let result = await testNapi.VideoVp9DecFunction0011();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01200
     * @tc.desc    Test AV1 decoder function with main profile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01200', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01200');
      let result = await testNapi.VideoAv1DecFunction0012();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01300
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01300
     * @tc.desc    Test AV1 decoder function with high profile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01300', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01300');
      let result = await testNapi.VideoAv1DecFunction0013();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01500
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01500
     * @tc.desc    Test AV1 decoder function with main profile 8bit
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01500', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01500');
      let result = await testNapi.VideoAv1DecFunction0015();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01600
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01600
     * @tc.desc    Test AV1 decoder function with high profile 8bit
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01600', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_AV1DEC_FUNCTION_01600');
      let result = await testNapi.VideoAv1DecFunction0016();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01900
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01900
     * @tc.desc    Test VP9 decoder function with level 4 profile 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01900', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_01900');
      let result = await testNapi.VideoVp9DecFunction0019();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_02000
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_02000
     * @tc.desc    Test VP9 decoder function with level 4 profile 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_02000', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP9DEC_FUNCTION_02000');
      let result = await testNapi.VideoVp9DecFunction0020();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_02100
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_02100
     * @tc.desc    Test VP8 decoder function with 1080p
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_02100', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_VP8DEC_FUNCTION_02100');
      let result = await testNapi.VideoVp8DecFunction0021();
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  SUB_MUlTIMEDIA_VIDEO_CINEPAKDEC_FUNCTION_02200
     * @tc.name    SUB_MUlTIMEDIA_VIDEO_CINEPAKDEC_FUNCTION_02200
     * @tc.desc    Test CINEPAK decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('SUB_MUlTIMEDIA_VIDEO_CINEPAKDEC_FUNCTION_02200', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test SUB_MUlTIMEDIA_VIDEO_CINEPAKDEC_FUNCTION_02200');
      let result = await testNapi.VideoCinepakDecFunction0022();
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}
