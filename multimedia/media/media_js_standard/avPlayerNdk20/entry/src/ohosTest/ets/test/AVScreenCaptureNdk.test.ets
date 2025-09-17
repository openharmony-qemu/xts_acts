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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avscreencapture from 'libavscreencapturendk.so'
import { Driver } from '@kit.TestKit';
import Utils from './Utils';
import { router } from '@kit.ArkUI';

export default function AVScreenCaptureNdkTest() {
  describe('AVScreenCaptureNdkTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_Init0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCapture0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCapture0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenCapture0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenCapture0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenRecording0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenRecording0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenRecording0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenRecording0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_AcquireAudioBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_AcquireAudioBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseAudioBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseAudioBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseVideoBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseVideoBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetMicrophoneEnabled0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetStateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetStateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDataCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetErrorCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCaptureWithSurface0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCaptureWithSurface0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCanvasRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCanvasRotation0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseContentFilter0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseContentFilter0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddAudioContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddAudioContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ExcludeContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ExcludeContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddWindowContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddWindowContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ResizeCanvas0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ResizeCanvas0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SkipPrivacyMode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetMaxVideoFrameRate0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ShowCursor0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDisplayCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDisplayCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseCaptureStrategy0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureStrategy0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureStrategy0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureContentChangedCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureContentChangedCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureArea0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPrivacyMaskMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPrivacyMaskMode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForCanvasFollowRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForCanvasFollowRotation0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetCaptureTypeSelected0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetCaptureTypeSelected0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetDisplayIdSelected0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetDisplayIdSelected0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForBFramesEncoding0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPickerPopUp0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForFillMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })
  })
}
