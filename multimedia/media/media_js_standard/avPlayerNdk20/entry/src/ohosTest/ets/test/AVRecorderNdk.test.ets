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
import avrecorder from 'libavrecorderndk.so'

export default function AVRecorderNdkTest() {
  describe('AVRecorderNdkTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Prepare0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100 start====");
          let result: number = avrecorder.OH_AVRecorder_GetAVRecorderConfig0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101 start====");
          let result: number = avrecorder.OH_AVRecorder_GetInputSurface0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100 start====");
          let result: number = avrecorder.OH_AVRecorder_UpdateRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Start0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Start0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Start0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Start0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Start0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Start0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Pause0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Pause0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Pause0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Pause0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Pause0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Pause0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Resume0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Resume0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Resume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Resume0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Resume0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Resume0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Stop0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Stop0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Stop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Stop0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Stop0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Stop0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Reset0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Reset0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Reset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Reset0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Reset0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Reset0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Release0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Release0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100 start====");
          let result: number = avrecorder.OH_AVRecorder_GetAvailableEncoder0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetStateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetStateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetErrorCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetUriCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetUriCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetWillMuteWhenInterrupted0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })
  })
}
