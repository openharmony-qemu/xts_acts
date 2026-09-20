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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativeRecordCmdTest() {
  describe('DrawingNativeRecordCmdTest', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // RecordCmdUtils BeginRecording related test cases (2 cases)
    /**
     * @tc.name   testRecordCmdUtilsBeginRecordingAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsBeginRecording_0100
     * @tc.desc   test for testRecordCmdUtilsBeginRecordingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsBeginRecordingAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsBeginRecording(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsBeginRecordingCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsBeginRecording_0200
     * @tc.desc   test for testRecordCmdUtilsBeginRecordingCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testRecordCmdUtilsBeginRecordingCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsBeginRecording(1);
      expect(result).assertEqual(0);
    })

    // RecordCmdUtils Destroy related test cases (1 case)
    /**
     * @tc.name   testRecordCmdUtilsDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsDestroy_0100
     * @tc.desc   test for testRecordCmdUtilsDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRecordCmdUtilsDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsDestroy(0);
      expect(result).assertEqual(0);
    })

    // RecordCmdUtils FinishRecording related test cases (2 cases)
    /**
     * @tc.name   testRecordCmdUtilsFinishRecordingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsFinishRecording_0100
     * @tc.desc   test for testRecordCmdUtilsFinishRecordingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRecordCmdUtilsFinishRecordingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsFinishRecording(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsFinishRecordingNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsFinishRecording_0200
     * @tc.desc   test for testRecordCmdUtilsFinishRecordingNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsFinishRecordingNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsFinishRecording(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdDestroy_0100
     * @tc.desc   test for testRecordCmdDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRecordCmdDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdDestroy_0200
     * @tc.desc   test for testRecordCmdDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRecordCmdDestroyNULL', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRecordCmd_0100
     * @tc.desc   test for testCanvasDrawRecordCmdNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRecordCmdNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdABNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRecordCmd_0200
     * @tc.desc   test for testCanvasDrawRecordCmdABNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRecordCmdABNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdNestingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRecordCmd_0300
     * @tc.desc   test for testCanvasDrawRecordCmdNestingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRecordCmdNestingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdNestingAbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRecordCmd_0400
     * @tc.desc   test for testCanvasDrawRecordCmdNestingAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdNestingAbNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdNestingAbNormal1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRecordCmd_0500
     * @tc.desc   test for testCanvasDrawRecordCmdNestingAbNormal1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdNestingAbNormal1', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetHeightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0100
     * @tc.desc   test for testRecordCmdUtilsGetHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetHeightNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetHeightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0200
     * @tc.desc   test for testRecordCmdUtilsGetHeightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetHeightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetHeightAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0300
     * @tc.desc   test for testRecordCmdUtilsGetHeightAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetHeightAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetHeightMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0400
     * @tc.desc   test for testRecordCmdUtilsGetHeightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetHeightMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetWidthNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0500
     * @tc.desc   test for testRecordCmdUtilsGetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetWidthNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetWidthNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0600
     * @tc.desc   test for testRecordCmdUtilsGetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetWidthNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetWidthAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0700
     * @tc.desc   test for testRecordCmdUtilsGetWidthAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetWidthAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRecordCmdUtilsGetWidthMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRecordCmdUtilsGetHeightOrWidth_0800
     * @tc.desc   test for testRecordCmdUtilsGetWidthMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsGetWidthMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsGetHeightOrWidth(7);
      expect(result).assertEqual(0);
    })
  })
}