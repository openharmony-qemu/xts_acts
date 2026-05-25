/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import audio from '@ohos.multimedia.audio';
import {BusinessError} from '@ohos.base';

export default function audioRendererTest() {
  describe('audioRendererTest', () => {
    let TagFrmwkRender = "AudioFrameworkRenderLog";
    let TagFrmwk = "AudioFrameworkTest";
    let audioRenderer: audio.AudioRenderer;
    console.info(`${TagFrmwkRender}: Create AudioManger Object JS Framework`);
    let sleep = (ms: number): Promise<void> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(() => {
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(() => {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
    })

    afterAll(async () => {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0001
     * @tc.desc   set sample rate 384000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0001", TestType.Function | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 384000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        await audioRenderer.start();
        console.info(`AudioRenderer start : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer start : ERROR`);
        expect(false).assertTrue();
      }
      await audioRenderer.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('AudioRenderer test case completed')
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0002
     * @tc.desc   set sample rate SAMPLE_RATE_384000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0002", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_384000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      console.info(`sample rate: `, Object.values(audio.AudioSamplingRate));
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        await audioRenderer.start();
        console.info(`AudioRenderer start : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer start : ERROR`);
        expect(false).assertTrue();
      }
      await audioRenderer.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('AudioRenderer test case completed')
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0003
     * @tc.desc   set sample rate 383990
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0003", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 383990,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        await audioRenderer.start();
        console.info(`AudioRenderer start : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer start : ERROR`);
        expect(false).assertTrue();
      }
      await audioRenderer.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('AudioRenderer test case completed')
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0004
     * @tc.desc   set sample rate 8010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0004", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 8010,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      try {
        await audioRenderer.start();
        console.info(`AudioRenderer start : SUCCESS`);
      } catch (err) {
        console.info(`AudioRenderer start : ERROR`);
        expect(false).assertTrue();
      }
      await audioRenderer.release().then(() => {
        console.info(`AudioRenderer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`AudioRenderer release :ERROR : ${err.message}`);
        expect(false).assertTrue();
      });
      console.info('AudioRenderer test case completed')
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0005
     * @tc.desc   set sample rate 7990
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_SAMPLE_RATE_0005", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 7990,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      
     try {
       let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
       console.info(`AudioRenderer create : SUCCESS`);
       expect(false).assertTrue();
       await audioRenderer.release();
     } catch (err) {
       console.info(`AudioRenderer create : ERROR`);
       expect(Number(err.code)).assertEqual(6800301);
     } finally {
         if (audioRenderer) {
           await audioRenderer.release();
         }
       }
     console.info('AudioRenderer test case completed')
     done();
   })
  })
}