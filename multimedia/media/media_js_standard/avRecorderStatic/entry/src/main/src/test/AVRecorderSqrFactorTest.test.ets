'use static';
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

import media from '@ohos.multimedia.media';
import { describe, it, expect, Level } from '../../../hypium/index';
import Common, { FdObject } from './Common.test';

const TAG = 'AVRecorderSqrFactorTest: ';
const SQR_FACTOR_MIN: int = 0;
const SQR_FACTOR_MAX: int = 51;

interface SqrCase {
  name: string;
  sqrFactor?: int;
  enableStableQualityMode: boolean;
  expectError: boolean;
  errCode?: number;
  desc: string;
}

const SQR_CASES: SqrCase[] = [
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100', sqrFactor: SQR_FACTOR_MIN,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=0 (min boundary)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200', sqrFactor: SQR_FACTOR_MAX,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=51 (max boundary)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300', sqrFactor: 27,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=27 (normal value)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400', sqrFactor: -1,
    enableStableQualityMode: true, expectError: true, errCode: 401, desc: 'sqrFactor=-1 (invalid, below min)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500', sqrFactor: 52,
    enableStableQualityMode: true, expectError: true, errCode: 401, desc: 'sqrFactor=52 (invalid, above max)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600', sqrFactor: 10,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=10 and release success' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700', sqrFactor: undefined,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor not set, skip validation' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800', sqrFactor: 1,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=1 (boundary min+1)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900', sqrFactor: 50,
    enableStableQualityMode: true, expectError: false, desc: 'sqrFactor=50 (boundary max-1)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000', sqrFactor: -1,
    enableStableQualityMode: false, expectError: false, desc: 'sqrFactor=-1, no validation (mode=false)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100', sqrFactor: 52,
    enableStableQualityMode: false, expectError: false, desc: 'sqrFactor=52, no validation (mode=false)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200', sqrFactor: 27,
    enableStableQualityMode: false, expectError: false, desc: 'sqrFactor=27 (VBR mode)' },
  { name: 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300', sqrFactor: undefined,
    enableStableQualityMode: false, expectError: false, desc: 'sqrFactor not set (default behavior)' },
];

function buildSqrProfile(sqrFactor: int | undefined, enableStableQualityMode: boolean): media.AVRecorderProfile {
  let profile: media.AVRecorderProfile = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 280000,
    videoCodec: media.CodecMimeType.VIDEO_HEVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30,
    enableStableQualityMode: enableStableQualityMode,
  };
  if (sqrFactor !== undefined) {
    profile.sqrFactor = sqrFactor;
  }
  return profile;
}

function buildSqrConfig(sqrFactor: int | undefined, enableStableQualityMode: boolean,
  fdPath: string): media.AVRecorderConfig {
  return {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile: buildSqrProfile(sqrFactor, enableStableQualityMode),
    url: fdPath,
  };
}

export default function AVRecorderSqrFactorTest() {
  describe('AVRecorderSqrFactorTest', () => {
    let commonFun = new Common();

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100
     * @tc.desc   1.create 2.prepare with sqrFactor=0 (min boundary) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[0], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200
     * @tc.desc   1.create 2.prepare with sqrFactor=51 (max boundary) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[1], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300
     * @tc.desc   1.create 2.prepare with sqrFactor=27 (normal value) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[2], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400
     * @tc.desc   1.create 2.prepare with sqrFactor=-1 (invalid, below min) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[3], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500
     * @tc.desc   1.create 2.prepare with sqrFactor=52 (invalid, above max) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[4], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600
     * @tc.desc   1.create 2.prepare with sqrFactor=10 and release success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[5], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700
     * @tc.desc   1.create 2.prepare with sqrFactor not set, skip validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[6], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800
     * @tc.desc   1.create 2.prepare with sqrFactor=1 (boundary min+1) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[7], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900
     * @tc.desc   1.create 2.prepare with sqrFactor=50 (boundary max-1) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[8], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000
     * @tc.desc   1.create 2.prepare with sqrFactor=-1, no validation (mode=false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[9], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100
     * @tc.desc   1.create 2.prepare with sqrFactor=52, no validation (mode=false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[10], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200
     * @tc.desc   1.create 2.prepare with sqrFactor=27 (VBR mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[11], commonFun, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300
     * @tc.desc   1.create 2.prepare with sqrFactor not set (default behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300', Level.LEVEL0, async (done: () => void) => {
      await runSqrCase(SQR_CASES[12], commonFun, done);
    });
  })
}

async function runSqrCase(tc: SqrCase, commonFun: Common, done: () => void): Promise<void> {
  console.info(TAG + tc.name + ' start');
  let avRecorder: media.AVRecorder | undefined = undefined;
  let fdObject: FdObject = {
    fileAsset: null,
    fdNumber: null
  };
  try {
    let fileName = commonFun.resourceName();
    fdObject = await commonFun.getFd(fileName);
    const fdPath = 'fd://' + fdObject.fdNumber;
    const avConfig = buildSqrConfig(tc.sqrFactor, tc.enableStableQualityMode, fdPath);

    avRecorder = await media.createAVRecorder();
    if (avRecorder == undefined) {
      console.error(TAG + 'createAVRecorder failed');
      expect().assertFail();
      done();
      return;
    }
    await avRecorder.prepare(avConfig);
    if (tc.expectError) {
      console.error(TAG + 'prepare should have failed for ' + tc.desc);
      await avRecorder.release();
      expect().assertFail();
    } else {
      console.info(TAG + 'prepare success for ' + tc.desc);
      await avRecorder.release();
      expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
    }
  } catch (err) {
    if (tc.expectError) {
      console.info(TAG + 'prepare failed as expected for ' + tc.desc + ': ' + JSON.stringify(err));
      expect(err.code).assertEqual(tc.errCode!);
    } else {
      console.error(TAG + tc.name + ' failed: ' + JSON.stringify(err));
      expect().assertFail();
    }
  } finally {
    if (avRecorder != undefined) {
      try {
        await avRecorder.release();
      } catch (e) {
        console.error(TAG + 'release failed: ' + JSON.stringify(e));
      }
      avRecorder = undefined;
    }
    await commonFun.closeFd(fdObject.fdNumber);
  }
  console.info(TAG + tc.name + ' end');
  done();
}
