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

import { beforeAll, beforeEach, afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import lowpoweraudiosinkndk from 'liblowpoweraudiosinkndk.so'
import { fileIo as fs } from '@kit.CoreFileKit';

export default function LowPowerSinkNdkTest() {
  describe('LowPowerSinkNdkTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(done, 100);
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Configure0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Configure0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Configure0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetParameter0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetParameter0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Start0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0200====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Start0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Pause0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Resume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Flush0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Stop0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Reset0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetVolume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetPlaybackSpeed0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_ReturnSamples0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_RegisterCallback0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_RegisterCallback0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDataNeededListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDataNeededListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetErrorListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetInterruptListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetEosListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Configure0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Configure0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetParameter0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetParameter0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RenderFirstFrame0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Reset0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetSyncAudioSink0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetTargetStartFrame0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_ReturnSamples0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RegisterCallback0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0200 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RegisterCallback0200();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback_0200 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetDataNeededListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener_0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetErrorListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetRenderStartListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener_0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener_0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener_0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetEosListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer_0100
     * @tc.number SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_AVSamplesBuffer_AppendOneBuffer0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain_0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Create0100();
            expect(1).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_GetLatestPts0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAVSink_GetCapability0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_CreateByMime0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Create0100();
            expect(1).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime_0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_CreateByMime0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime_0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
    
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Pause0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Resume0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Flush0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Stop0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Reset0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetVolume0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0300
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0300
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume_0300 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetVolume0300();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0100 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_GetParameter0100();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0200
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0200
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0200 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_GetParameter0200();
        expect(0).assertEqual(result);
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0300
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0300
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
        console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetParameter_0300 start====");
        let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_GetParameter0300();
        expect(0).assertEqual(result);
        done()
      }
    })

  })
}
