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
        "av1_high_L4.0_1920x1080.ivf"
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
          hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] %{public}s copy exception: %{public}s', fileName, JSON.stringify(error));
        }
      }
      
      hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] sandbox path: %{public}s', dir);
      hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] Copy completed: %{public}d success, %{public}d failed, total %{public}d files',
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
     * @tc.number  VIDEO_VC1DEC_FUNCTION_0001
     * @tc.name    VIDEO_VC1DEC_FUNCTION_0001
     * @tc.desc    Test VC1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VC1DEC_FUNCTION_0001', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_FUNCTION_0001');
      let result = await testNapi.functest(0);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MJPEGDEC_FUNCTION_0003
     * @tc.name    VIDEO_MJPEGDEC_FUNCTION_0003
     * @tc.desc    Test MJPEG decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MJPEGDEC_FUNCTION_0003', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MJPEGDEC_FUNCTION_0003');
      let result = await testNapi.functest(1);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_FUNCTION_0005
     * @tc.name    VIDEO_MSVIDEO1DEC_FUNCTION_0005
     * @tc.desc    Test MSVIDEO1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MSVIDEO1DEC_FUNCTION_0005', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_FUNCTION_0005');
      let result = await testNapi.functest(2);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_FUNCTION_0002
     * @tc.name    VIDEO_VC1DEC_FUNCTION_0002
     * @tc.desc    Test VC1 decoder with surface mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VC1DEC_FUNCTION_0002', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_FUNCTION_0002');
      let result = await testNapi.functest(3);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MJPEGDEC_FUNCTION_0004
     * @tc.name    VIDEO_MJPEGDEC_FUNCTION_0004
     * @tc.desc    Test MJPEG decoder with surface mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MJPEGDEC_FUNCTION_0004', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MJPEGDEC_FUNCTION_0004');
      let result = await testNapi.functest(4);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_FUNCTION_0006
     * @tc.name    VIDEO_MSVIDEO1DEC_FUNCTION_0006
     * @tc.desc    Test MSVIDEO1 decoder with surface mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MSVIDEO1DEC_FUNCTION_0006', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_FUNCTION_0006');
      let result = await testNapi.functest(5);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP8DEC_FUNCTION_0007
     * @tc.name    VIDEO_VP8DEC_FUNCTION_0007
     * @tc.desc    Test VP8 decoder function
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP8DEC_FUNCTION_0007', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP8DEC_FUNCTION_0007');
      let result = await testNapi.functest(6);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0008
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0008
     * @tc.desc    Test VP9 decoder function with profile 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0008', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0008');
      let result = await testNapi.functest(7);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0009
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0009
     * @tc.desc    Test VP9 decoder function with profile 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0009', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0009');
      let result = await testNapi.functest(8);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0010
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0010
     * @tc.desc    Test VP9 decoder function with profile 2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0010', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0010');
      let result = await testNapi.functest(9);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0011
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0011
     * @tc.desc    Test VP9 decoder function with profile 3
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0011', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0011');
      let result = await testNapi.functest(10);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_FUNCTION_0012
     * @tc.name    VIDEO_AV1DEC_FUNCTION_0012
     * @tc.desc    Test AV1 decoder function with main profile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_AV1DEC_FUNCTION_0012', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_FUNCTION_0012');
      let result = await testNapi.functest(11);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_FUNCTION_0013
     * @tc.name    VIDEO_AV1DEC_FUNCTION_0013
     * @tc.desc    Test AV1 decoder function with high profile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_AV1DEC_FUNCTION_0013', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_FUNCTION_0013');
      let result = await testNapi.functest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_FUNCTION_0015
     * @tc.name    VIDEO_AV1DEC_FUNCTION_0015
     * @tc.desc    Test AV1 decoder function with main profile 8bit
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_AV1DEC_FUNCTION_0015', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_FUNCTION_0015');
      let result = await testNapi.functest(13);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_AV1DEC_FUNCTION_0016
     * @tc.name    VIDEO_AV1DEC_FUNCTION_0016
     * @tc.desc    Test AV1 decoder function with high profile 8bit
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_AV1DEC_FUNCTION_0016', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_AV1DEC_FUNCTION_0016');
      let result = await testNapi.functest(14);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0019
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0019
     * @tc.desc    Test VP9 decoder function with level 4 profile 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0019', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0019');
      let result = await testNapi.functest(15);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP9DEC_FUNCTION_0020
     * @tc.name    VIDEO_VP9DEC_FUNCTION_0020
     * @tc.desc    Test VP9 decoder function with level 4 profile 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP9DEC_FUNCTION_0020', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP9DEC_FUNCTION_0020');
      let result = await testNapi.functest(16);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VP8DEC_FUNCTION_0021
     * @tc.name    VIDEO_VP8DEC_FUNCTION_0021
     * @tc.desc    Test VP8 decoder function with 1080p
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VP8DEC_FUNCTION_0021', Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VP8DEC_FUNCTION_0021');
      let result = await testNapi.functest(17);
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}
