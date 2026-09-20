'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
const SQR_FACTOR_MIN = 0;
const SQR_FACTOR_MAX = 51;

export default function AVRecorderSqrFactorTest() {
  describe('AVRecorderSqrFactorTest', () => {
    let avRecorder: media.AVRecorder | undefined = undefined;
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    };
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
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: SQR_FACTOR_MIN
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=0 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200
     * @tc.desc   1.create 2.prepare with sqrFactor=51 (max boundary) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: SQR_FACTOR_MAX
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=51 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300
     * @tc.desc   1.create 2.prepare with sqrFactor=27 (normal value) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: 27
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=27 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400
     * @tc.desc   1.create 2.prepare with sqrFactor=-1 (invalid, below min) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: -1
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.error(TAG + 'prepare with sqrFactor=-1 should have failed');
        await avRecorder!.release();
        expect().assertFail();
      } catch (err) {
        console.info(TAG + 'prepare with sqrFactor=-1 failed as expected: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500
     * @tc.desc   1.create 2.prepare with sqrFactor=52 (invalid, above max) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: 52
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.error(TAG + 'prepare with sqrFactor=52 should have failed');
        await avRecorder!.release();
        expect().assertFail();
      } catch (err) {
        console.info(TAG + 'prepare with sqrFactor=52 failed as expected: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600
     * @tc.desc   1.create 2.prepare with valid sqrFactor=10 and enableStableQualityMode=true 3.release success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: 10
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=10 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700
     * @tc.desc   1.create 2.prepare with sqrFactor not set and enableStableQualityMode=true (sqrFactorSet=false, skip validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare without sqrFactor and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800
     * @tc.desc   1.create 2.prepare with sqrFactor=1 (boundary min+1) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: 1
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=1 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900
     * @tc.desc   1.create 2.prepare with sqrFactor=50 (boundary max-1) and enableStableQualityMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: true,
          sqrFactor: 50
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=50 and enableStableQualityMode=true success');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000
     * @tc.desc   1.create 2.prepare with sqrFactor=-1 (invalid) and enableStableQualityMode=false (no validation, prepare success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: false,
          sqrFactor: -1
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=-1 and enableStableQualityMode=false success (no validation)');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100
     * @tc.desc   1.create 2.prepare with sqrFactor=52 (invalid) and enableStableQualityMode=false (no validation, prepare success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: false,
          sqrFactor: 52
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=52 and enableStableQualityMode=false success (no validation)');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200
     * @tc.desc   1.create 2.prepare with sqrFactor=27 (valid) and enableStableQualityMode=false (sqrFactor accepted but VBR mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200 start');
      try {
        let avProfile: media.AVRecorderProfile = {
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
          enableStableQualityMode: false,
          sqrFactor: 27
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare with sqrFactor=27 and enableStableQualityMode=false success (VBR mode)');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300
     * @tc.desc   1.create 2.prepare with sqrFactor not set and enableStableQualityMode=false (default behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300', Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300 start');
      try {
        let avProfile: media.AVRecorderProfile = {
          audioBitrate: 48000,
          audioChannels: 2,
          audioCodec: media.CodecMimeType.AUDIO_AAC,
          audioSampleRate: 48000,
          fileFormat: media.ContainerFormatType.CFT_MPEG_4,
          videoBitrate: 280000,
          videoCodec: media.CodecMimeType.VIDEO_HEVC,
          videoFrameWidth: 640,
          videoFrameHeight: 480,
          videoFrameRate: 30
        };
        let avConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
          profile: avProfile,
          url: 'fd://35'
        };
        let fileName = commonFun.resourceName();
        fdObject = await commonFun.getFd(fileName);
        const fdPath = 'fd://' + fdObject.fdNumber;
        avConfig.url = fdPath;

        avRecorder = await media.createAVRecorder();
        if (avRecorder == undefined) {
          console.error(TAG + 'createAVRecorder failed');
          expect().assertFail();
          done();
          return;
        }
        await avRecorder!.prepare(avConfig);
        console.info(TAG + 'prepare without sqrFactor and enableStableQualityMode=false success (default)');
        await avRecorder!.release();
        expect(avRecorder!.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
      } catch (err) {
        console.error(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300 failed: ' + JSON.stringify(err));
        expect().assertFail();
      } finally {
        if (avRecorder != undefined) {
          try {
            await avRecorder!.release();
          } catch (e) {
            console.error(TAG + 'release failed: ' + JSON.stringify(e));
          }
          avRecorder = undefined;
        }
        await commonFun.closeFd(fdObject.fdNumber);
      }
      console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_SQRFACTOR_PROMISE_1300 end');
      done();
    })
  })
}
