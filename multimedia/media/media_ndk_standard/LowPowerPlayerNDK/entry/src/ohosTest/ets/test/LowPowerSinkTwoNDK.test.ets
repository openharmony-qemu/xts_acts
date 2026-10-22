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

import { beforeAll, beforeEach, afterEach describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import lowpoweraudiosinkndk from 'liblowpoweraudiosinktwondk.so'
import { fileIo as fs } from '@kit.CoreFileKit';

export default function LowPowerSinkNdk2Test() {
  describe('LowPowerSinkNdk2Test', () => {
    afterEach(async (done: Function) => {
      setTimeout(done, 100);
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Start0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Resume0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Flush0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Stop0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetParameter0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RenderFirstFrame0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Reset0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetSyncAudioSink0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0300
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0300
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0300 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0300();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0300 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetDataNeededListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetDataNeededListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetDataNeededListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetDataNeededListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetDataNeededListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetDataNeededListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetStreamChangedListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetStreamChangedListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetStreamChangedListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetStreamChangedListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetStreamChangedListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetStreamChangedListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetFirstFrameDecodedListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetEosListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetEosListener_0101
     * @tc.desc   test OH_LowPowerVideoSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetEosListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetEosListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetEosListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetEosListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetRenderStartListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetRenderStartListener_0101
     * @tc.desc   test OH_LowPowerVideoSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetRenderStartListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetRenderStartListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetRenderStartListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetRenderStartListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_SetErrorListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_SetErrorListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_SetErrorListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetErrorListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetErrorListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetErrorListener_0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_GetParameter0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_GetParameter0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_GetParameter_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_AVSamplesBuffer_GetRemainedCapacity_0100
     * @tc.number SUB_MULTIMEIDA_OH_AVSamplesBuffer_GetRemainedCapacity_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_AVSamplesBuffer_GetRemainedCapacity_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_GetRemainedCapacity_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_AVSamplesBuffer_GetRemainedCapacity0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_GetRemainedCapacity_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0100 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0100();
        expect(0).assertEqual(result);
        done()
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0300
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0300
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0300 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0300();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0400
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0400
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0400 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0400();
        expect(0).assertEqual(result);
        done()
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0100 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetPlaybackSpeed0100();
        expect(0).assertEqual(result);
        done()
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetPlaybackSpeed0200();
        expect(0).assertEqual(result);
        done()
      }
    })


  })
}
