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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingTsRecordCmdUtilsTest(): void {
  describe('DrawingTsRecordCmdUtilsTest', () => {
    let pixel: image.PixelMap | undefined;

    beforeEach(async (): Promise<void> => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.name   testDrawRecordCmdNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0100
     * @tc.desc   testDrawRecordCmdNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawRecordCmdNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testDrawRecordCmdNormalStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        if(recordCanvas == undefined){
          console.info(msg + ' drawRecordCmd undefined failed');
          expect().assertFail();
        } else {
          let pen = new drawing.Pen();
          pen.setStrokeWidth(5);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas.attachPen(pen);
          recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
          recordCanvas.detachPen();
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          if(recordCmd == undefined){
            console.info(msg + ' recordCmd undefined failed');
            expect().assertFail();
          } else {
            expect(recordCmd != null && recordCmd != undefined).assertTrue();
            canvas.drawRecordCmd(recordCmd);
            console.info(msg + ' drawRecordCmd succeeded');
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdEmptyRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0200
     * @tc.desc   testDrawRecordCmdEmptyRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdEmptyRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdEmptyRecordingStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with empty recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultipleDrawCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0300
     * @tc.desc   testDrawRecordCmdMultipleDrawCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultipleDrawCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultipleDrawCallsStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas!.drawRect({ left: 50, right: 100, top: 50, bottom: 100 });
        recordCanvas!.drawCircle(50, 50, 30);
        recordCanvas!.drawLine(0, 0, 100, 100);
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with multiple draw calls succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultiplePlaybackStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0400
     * @tc.desc   testDrawRecordCmdMultiplePlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultiplePlaybackStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultiplePlaybackStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        for (let i = 0; i < 10; i++) {
          canvas.drawRecordCmd(recordCmd!);
        }
        console.info(msg + ' drawRecordCmd multiple playback succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdDifferentCanvasStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0500
     * @tc.desc   testDrawRecordCmdDifferentCanvas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdDifferentCanvasStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdDifferentCanvasStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        let canvas1 = new drawing.Canvas(pixel!);
        canvas1.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd on canvas1 succeeded');

        let canvas2 = new drawing.Canvas(pixel!);
        canvas2.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd on canvas2 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithBrushStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0600
     * @tc.desc   testDrawRecordCmdWithBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithBrushStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithBrushStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas!.attachBrush(brush);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachBrush();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithPathStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0700
     * @tc.desc   testDrawRecordCmdWithPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithPathStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
        recordCanvas!.attachPen(pen);
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(90, 10);
        path.lineTo(90, 90);
        path.lineTo(10, 90);
        path.close();
        recordCanvas!.drawPath(path);
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with path succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawColorStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0800
     * @tc.desc   testDrawRecordCmdWithDrawColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawColorStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawColorStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        recordCanvas!.drawColor(0xFFFF0000.toInt());
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawColor succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawCircleStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_0900
     * @tc.desc   testDrawRecordCmdWithDrawCircle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawCircleStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawCircleStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawCircle(50, 50, 30);
        recordCanvas!.drawCircle(100, 100, 50);
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawCircle succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawLineStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1000
     * @tc.desc   testDrawRecordCmdWithDrawLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawLineStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawLineStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(2);
        pen.setColor({ alpha: 255, red: 128, green: 128, blue: 128 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawLine(0, 0, 100, 100);
        recordCanvas!.drawLine(100, 0, 0, 100);
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawLine succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithPenAndBrushStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1100
     * @tc.desc   testDrawRecordCmdWithPenAndBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithPenAndBrushStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithPenAndBrushStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas!.attachBrush(brush);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        recordCanvas!.detachBrush();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with pen and brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithRoundRectStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1200
     * @tc.desc   testDrawRecordCmdWithRoundRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithRoundRectStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithRoundRectStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        let roundRect = new drawing.RoundRect({ left: 10, top: 10, right: 90, bottom: 90 }, 10, 10);
        recordCanvas!.drawRoundRect(roundRect);
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with roundRect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdReplayAfterDrawStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1300
     * @tc.desc   testDrawRecordCmdReplayAfterDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdReplayAfterDrawStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdReplayAfterDrawStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        canvas.attachPen(pen);
        canvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        canvas.detachPen();

        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let recordPen = new drawing.Pen();
        recordPen.setStrokeWidth(3);
        recordPen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(recordPen);
        recordCanvas!.drawRect({ left: 50, right: 100, top: 50, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd replay after draw succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithSaveRestoreStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1400
     * @tc.desc   testDrawRecordCmdWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithSaveRestoreStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithSaveRestoreStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        recordCanvas!.save();
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas!.detachPen();
        recordCanvas!.restore();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with save/restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdChainingPlaybackStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1500
     * @tc.desc   testDrawRecordCmdChainingPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdChainingPlaybackStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdChainingPlaybackStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        for (let i = 0; i < 20; i++) {
          let tmpCanvas = new drawing.Canvas(pixel!);
          tmpCanvas.drawRecordCmd(recordCmd!);
        }
        console.info(msg + ' drawRecordCmd chaining playback succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1600
     * @tc.desc   testFinishRecordingNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinishRecordingNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFinishRecordingNormalStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' finishRecording succeeded and returned valid RecordCmd');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingEmptyRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1700
     * @tc.desc   testFinishRecordingEmptyRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingEmptyRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingEmptyRecordingStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' finishRecording with empty recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingReturnReusableStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1800
     * @tc.desc   testFinishRecordingReturnReusable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingReturnReusableStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingReturnReusableStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        for (let i = 0; i < 5; i++) {
          let tmpCanvas = new drawing.Canvas(pixel!);
          tmpCanvas.drawRecordCmd(recordCmd!);
        }
        console.info(msg + ' finishRecording return value reusable succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingComplexRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_1900
     * @tc.desc   testFinishRecordingComplexRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingComplexRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingComplexRecordingStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas!.attachBrush(brush);
        recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas!.drawCircle(100, 100, 30);
        recordCanvas!.drawLine(0, 0, 200, 200);
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(90, 10);
        path.lineTo(90, 90);
        path.close();
        recordCanvas!.drawPath(path);
        let roundRect = new drawing.RoundRect({ left: 20, top: 20, right: 80, bottom: 80 }, 5, 5);
        recordCanvas!.drawRoundRect(roundRect);
        recordCanvas!.drawColor(0x800000FF.toInt());
        recordCanvas!.detachPen();
        recordCanvas!.detachBrush();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' finishRecording with complex recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2000
     * @tc.desc   testGetHeightNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHeightNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testGetHeightNormalStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 100);
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getHeight=${height}`);
        expect(height).assertEqual(100);
        recordCmdUtils.finishRecording();
        console.info(msg + ' getHeight normal succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2100
     * @tc.desc   testGetHeightBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightBoundaryValueStatic';
      let heights: Array<int> = [1, 1, 500, 1000, 10000];
      let widths: Array<int> = [1, 200, 500, 1000, 10000];
      for (let i = 0; i < heights.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(widths[i], heights[i]);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` getHeight[${i}]=${height}`);
          expect(height).assertEqual(heights[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getHeight boundary[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHeight boundary[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt());
        let height = recordCmdUtils.getHeight();
        let width = recordCmdUtils.getWidth();
        console.info(msg + ` MAX MIN getHeight=${height}  getWidth=${width}`);
        recordCmdUtils.finishRecording();
        console.info(msg + ` getHeight boundary MAX MIN succeeded`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHeight boundary MAX MIN errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightAfterFinishRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2200
     * @tc.desc   testGetHeightAfterFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightAfterFinishRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightAfterFinishRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 150);
        let heightBefore = recordCmdUtils.getHeight();
        expect(heightBefore).assertEqual(150);
        recordCmdUtils.finishRecording();
        let heightAfter = recordCmdUtils.getHeight();
        console.info(msg + ` heightBefore=${heightBefore}, heightAfter=${heightAfter}`);
        expect(heightAfter).assertEqual(0);
        console.info(msg + ' getHeight after finishRecording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightMultipleSizesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2300
     * @tc.desc   testGetHeightMultipleSizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightMultipleSizesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightMultipleSizesStatic';
      let testHeights: Array<int> = [50, 100, 200, 500, 800];

      for (let i = 0; i < testHeights.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, testHeights[i]);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` getHeight[${i}]=${height}, expected=${testHeights[i]}`);
          expect(height).assertEqual(testHeights[i]);
          recordCmdUtils.finishRecording();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHeight[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
      console.info(msg + ' getHeight multiple sizes succeeded');
    })

    /**
     * @tc.name   testGetHeightExtremeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2400
     * @tc.desc   testGetHeightExtremeValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightExtremeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightExtremeValueStatic';
      let extremeHeights: Array<int> = [10000, 60000, 100000];

      for (let i = 0; i < extremeHeights.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, extremeHeights[i]);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` getHeight extreme[${i}]=${height}, expected=${extremeHeights[i]}`);
          expect(height).assertEqual(extremeHeights[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getHeight extreme[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHeight extreme[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testGetWidthNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2500
     * @tc.desc   testGetWidthNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWidthNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testGetWidthNormalStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 100);
        let width = recordCmdUtils.getWidth();
        console.info(msg + ` getWidth=${width}`);
        expect(width).assertEqual(200);
        recordCmdUtils.finishRecording();
        console.info(msg + ' getWidth normal succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetWidthBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2600
     * @tc.desc   testGetWidthBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthBoundaryValueStatic';
      let widths: Array<int> = [1, 200, 500, 1000, 10000];
      let heights: Array<int> = [1, 1, 500, 1000, 10000];

      for (let i = 0; i < widths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(widths[i], heights[i]);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` getWidth[${i}]=${width}`);
          expect(width).assertEqual(widths[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getWidth boundary[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getWidth boundary[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testGetWidthAfterFinishRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2700
     * @tc.desc   testGetWidthAfterFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthAfterFinishRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthAfterFinishRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(250, 100);
        let widthBefore = recordCmdUtils.getWidth();
        expect(widthBefore).assertEqual(250);
        recordCmdUtils.finishRecording();
        let widthAfter = recordCmdUtils.getWidth();
        console.info(msg + ` widthBefore=${widthBefore}, widthAfter=${widthAfter}`);
        expect(widthAfter).assertEqual(0);
        console.info(msg + ' getWidth after finishRecording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetWidthMultipleSizesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2800
     * @tc.desc   testGetWidthMultipleSizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthMultipleSizesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthMultipleSizesStatic';
      let testWidths: Array<int> = [50, 100, 200, 500, 800];

      for (let i = 0; i < testWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(testWidths[i], 200);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` getWidth[${i}]=${width}, expected=${testWidths[i]}`);
          expect(width).assertEqual(testWidths[i]);
          recordCmdUtils.finishRecording();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getWidth[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
      console.info(msg + ' getWidth multiple sizes succeeded');
    })

    /**
     * @tc.name   testGetWidthExtremeValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_2900
     * @tc.desc   testGetWidthExtremeValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthExtremeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthExtremeValueStatic';
      let extremeWidths: Array<int> = [10000, 60000, 100000];

      for (let i = 0; i < extremeWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(extremeWidths[i], 200);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` getWidth extreme[${i}]=${width}, expected=${extremeWidths[i]}`);
          expect(width).assertEqual(extremeWidths[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getWidth extreme[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getWidth extreme[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testGetWidthGetHeightCombinedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3000
     * @tc.desc   testGetWidthGetHeightCombined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthGetHeightCombinedStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthGetHeightCombinedStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 100);
        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getWidth=${width}, getHeight=${height}`);
        expect(width).assertEqual(200);
        expect(height).assertEqual(100);
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' getWidth/getHeight combined succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRecordCmdUtilsFullWorkflowStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3100
     * @tc.desc   testRecordCmdUtilsFullWorkflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsFullWorkflowStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRecordCmdUtilsFullWorkflowStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(300, 150);
        expect(recordCanvas != null && recordCanvas != undefined).assertTrue();

        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        expect(width).assertEqual(300);
        expect(height).assertEqual(150);

        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();

        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' full workflow succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRecordCmdUtilsMultipleInstancesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3200
     * @tc.desc   testRecordCmdUtilsMultipleInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsMultipleInstancesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRecordCmdUtilsMultipleInstancesStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils1 = new drawing.RecordCmdUtils();
        let recordCanvas1: drawing.Canvas | undefined = recordCmdUtils1.beginRecording(200, 200);
        let pen1 = new drawing.Pen();
        pen1.setStrokeWidth(5);
        pen1.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas1!.attachPen(pen1);
        recordCanvas1!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas1!.detachPen();
        let width1 = recordCmdUtils1.getWidth();
        let height1 = recordCmdUtils1.getHeight();
        expect(width1).assertEqual(200);
        expect(height1).assertEqual(200);
        let recordCmd1: drawing.RecordCmd | undefined = recordCmdUtils1.finishRecording();
        expect(recordCmd1 != null && recordCmd1 != undefined).assertTrue();

        let recordCmdUtils2 = new drawing.RecordCmdUtils();
        let recordCanvas2: drawing.Canvas | undefined = recordCmdUtils2.beginRecording(150, 100);
        let pen2 = new drawing.Pen();
        pen2.setStrokeWidth(3);
        pen2.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas2!.attachPen(pen2);
        recordCanvas2!.drawCircle(50, 50, 30);
        recordCanvas2!.detachPen();
        let width2 = recordCmdUtils2.getWidth();
        let height2 = recordCmdUtils2.getHeight();
        expect(width2).assertEqual(150);
        expect(height2).assertEqual(100);
        let recordCmd2: drawing.RecordCmd | undefined = recordCmdUtils2.finishRecording();
        expect(recordCmd2 != null && recordCmd2 != undefined).assertTrue();

        canvas.drawRecordCmd(recordCmd1!);
        canvas.drawRecordCmd(recordCmd2!);
        console.info(msg + ' multiple RecordCmdUtils instances succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3300
     * @tc.desc   testDrawRecordCmdMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; i++) {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(i + 1);
          pen.setColor({ alpha: 255, red: i * 10, green: 0, blue: 0 });
          recordCanvas!.attachPen(pen);
          recordCanvas!.drawRect({ left: 0, right: i * 5, top: 0, bottom: i * 5 });
          recordCanvas!.detachPen();
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          expect(recordCmd != null && recordCmd != undefined).assertTrue();
          canvas.drawRecordCmd(recordCmd!);
        }
        console.info(msg + ' drawRecordCmd multiple calls succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightMinValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3400
     * @tc.desc   testGetHeightMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightMinValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightMinValueStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(1, 1);
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getHeight=${height}`);
        expect(height).assertEqual(1);
        recordCmdUtils.finishRecording();
        console.info(msg + ' getHeight with min value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetWidthMinValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3500
     * @tc.desc   testGetWidthMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthMinValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthMinValueStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(1, 1);
        let width = recordCmdUtils.getWidth();
        console.info(msg + ` getWidth=${width}`);
        expect(width).assertEqual(1);
        recordCmdUtils.finishRecording();
        console.info(msg + ' getWidth with min value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingWithoutBeginRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3600
     * @tc.desc   testFinishRecordingWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingWithoutBeginRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingWithoutBeginRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        console.info(msg + ` finishRecording without beginRecording returned: ${recordCmd}`);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` finishRecording without beginRecording errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFinishRecordingDoubleCallStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3700
     * @tc.desc   testFinishRecordingDoubleCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingDoubleCallStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingDoubleCallStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachPen();

        let recordCmd1: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        expect(recordCmd1 != null && recordCmd1 != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd1!);
        console.info(msg + ' first finishRecording succeeded');

        try {
          let recordCmd2: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          console.info(msg + ` second finishRecording returned: ${recordCmd2}`);
          if (recordCmd2 != null && recordCmd2 != undefined) {
            canvas.drawRecordCmd(recordCmd2!);
          }
          console.info(msg + ' second finishRecording handled gracefully');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` second finishRecording errorCode is: ${e.code} + errormsg is: ${e.message}`);
          console.info(msg + ' second finishRecording threw error as expected');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightWithoutBeginRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3800
     * @tc.desc   testGetHeightWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightWithoutBeginRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightWithoutBeginRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getHeight without beginRecording returned: ${height}`);
        expect(height).assertEqual(0);
        console.info(msg + ' getHeight without beginRecording returned 0 as expected');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHeight without beginRecording errorCode is: ${e.code} + errormsg is: ${e.message}`);
        console.info(msg + ' getHeight without beginRecording threw error as expected');
      }
    })

    /**
     * @tc.name   testGetWidthWithoutBeginRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_3900
     * @tc.desc   testGetWidthWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthWithoutBeginRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthWithoutBeginRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let width = recordCmdUtils.getWidth();
        console.info(msg + ` getWidth without beginRecording returned: ${width}`);
        expect(width).assertEqual(0);
        console.info(msg + ' getWidth without beginRecording returned 0 as expected');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getWidth without beginRecording errorCode is: ${e.code} + errormsg is: ${e.message}`);
        console.info(msg + ' getWidth without beginRecording threw error as expected');
      }
    })

    /**
     * @tc.name   testGetWidthGetHeightWithoutBeginRecordingCombinedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4000
     * @tc.desc   testGetWidthGetHeightWithoutBeginRecordingCombined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthGetHeightWithoutBeginRecordingCombinedStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthGetHeightWithoutBeginRecordingCombinedStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` width=${width}, height=${height} without beginRecording`);
        expect(width).assertEqual(0);
        expect(height).assertEqual(0);
        console.info(msg + ' getWidth/getHeight without beginRecording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        console.info(msg + ' getWidth/getHeight without beginRecording threw error as expected');
      }
    })

    /**
     * @tc.name   testGetHeightAfterDoubleFinishRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4100
     * @tc.desc   testGetHeightAfterDoubleFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightAfterDoubleFinishRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightAfterDoubleFinishRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 150);
        let heightBefore = recordCmdUtils.getHeight();
        expect(heightBefore).assertEqual(150);
        recordCmdUtils.finishRecording();
        try {
          recordCmdUtils.finishRecording();
        } catch (e) {
          console.info(msg + ' second finishRecording ignored');
        }
        let heightAfter = recordCmdUtils.getHeight();
        console.info(msg + ` heightBefore=${heightBefore}, heightAfter=${heightAfter}`);
        expect(heightAfter).assertEqual(0);
        console.info(msg + ' getHeight after double finishRecording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetWidthAfterDoubleFinishRecordingStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4200
     * @tc.desc   testGetWidthAfterDoubleFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthAfterDoubleFinishRecordingStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthAfterDoubleFinishRecordingStatic';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(250, 100);
        let widthBefore = recordCmdUtils.getWidth();
        expect(widthBefore).assertEqual(250);
        recordCmdUtils.finishRecording();
        try {
          recordCmdUtils.finishRecording();
        } catch (e) {
          console.info(msg + ' second finishRecording ignored');
        }
        let widthAfter = recordCmdUtils.getWidth();
        console.info(msg + ` widthBefore=${widthBefore}, widthAfter=${widthAfter}`);
        expect(widthAfter).assertEqual(0);
        console.info(msg + ' getWidth after double finishRecording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBeginRecordingBothNegativeStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4300
     * @tc.desc   testBeginRecordingBothNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingBothNegativeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingBothNegativeStatic';
      let negWidths: Array<int> = [-1, -100, -1000, -10000];
      let negHeights: Array<int> = [-1, -100, -1000, -10000];

      for (let i = 0; i < negWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(negWidths[i], negHeights[i]);
          console.info(msg + ` beginRecording with both negative[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with both negative[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingExtremeMaxValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4400
     * @tc.desc   testBeginRecordingExtremeMaxValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingExtremeMaxValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingExtremeMaxValueStatic';
      let canvas = new drawing.Canvas(pixel!);
      let extremeWidths: Array<int> = [10000, 60000, 100000, 500000];
      let extremeHeights: Array<int> = [10000, 60000, 100000, 500000];

      for (let i = 0; i < extremeWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(extremeWidths[i], extremeHeights[i]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas!.attachPen(pen);
          recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas!.detachPen();
          let width = recordCmdUtils.getWidth();
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` 1 extreme max[${i}] succeeded, width=${width}, height=${height}`);
          expect(width).assertEqual(extremeWidths[i]);
          expect(height).assertEqual(extremeHeights[i]);
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          canvas.drawRecordCmd(recordCmd!);
          let width2 = recordCmdUtils.getWidth();
          let height2 = recordCmdUtils.getHeight();
          console.info(msg + ` 2 extreme max[${i}] succeeded, width2=${width2}, height2=${height2}`);
          expect(width2).assertEqual(0);
          expect(height2).assertEqual(0);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` extreme max[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingExtremeMinValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4500
     * @tc.desc   testBeginRecordingExtremeMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingExtremeMinValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingExtremeMinValueStatic';
      let negMaxValue: int = (-Number.MAX_VALUE).toInt();
      let negSafeInteger: int = (-Number.MAX_SAFE_INTEGER).toInt();
      let extremeWidths: Array<int> = [-100, -1000, -10000, negSafeInteger, negMaxValue];
      let extremeHeights: Array<int> = [-100, -1000, -10000, negSafeInteger, negMaxValue];

      for (let i = 0; i < extremeWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(extremeWidths[i], extremeHeights[i]);
          console.info(msg + ` extreme min[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` extreme min[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingZeroValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4600
     * @tc.desc   testBeginRecordingZeroValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingZeroValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingZeroValueStatic';
      let zeroCases: Array<Array<int>> = [[0, 200], [200, 0], [0, 0]];

      for (let i = 0; i < zeroCases.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(zeroCases[i][0], zeroCases[i][1]);
          console.info(msg + ` beginRecording with zero[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with zero[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingSpecialNumberValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4700
     * @tc.desc   testBeginRecordingSpecialNumberValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingSpecialNumberValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingSpecialNumberValueStatic';
      let specialValues: Array<int> = [(Number.MIN_VALUE).toInt(), -1, -10, -100, -1000, -10000, -50000, (NaN).toInt(), (-Infinity).toInt(), (-Number.MIN_VALUE).toInt(), (-Number.MAX_VALUE).toInt()];

      for (let i = 0; i < specialValues.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(specialValues[i], 200);
          console.info(msg + ` beginRecording with special width[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special width[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }

      for (let i = 0; i < specialValues.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, specialValues[i]);
          console.info(msg + ` beginRecording with special height[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special height[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }
    })
    /**
     * @tc.name   testBeginRecordingSpecialNumberValue2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4800
     * @tc.desc   testBeginRecordingSpecialNumberValue2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingSpecialNumberValue2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingSpecialNumberValue2Static';
      let specialValues: Array<int> = [(Number.MAX_VALUE).toInt(), (Infinity).toInt()];

      try {
        console.info(msg + ` Number.MAX_VALUE toInt Value=${(Number.MAX_VALUE).toInt()}`);
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt());
        let height = recordCmdUtils.getHeight();
        let width = recordCmdUtils.getWidth();
        console.info(msg + ` MAX MIN getHeight=${height}  getWidth=${width}`);
        expect(width == (Number.MAX_VALUE).toInt()).assertTrue();
        expect(height == (Number.MAX_VALUE).toInt()).assertTrue();
        recordCmdUtils.finishRecording();
        console.info(msg + ` getHeight boundary MAX MIN succeeded`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getHeight boundary MAX MIN errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      for (let i = 0; i < specialValues.length; i++) {
        console.info(msg + ` beginRecording with special setValue[${i}] :${specialValues[i]}`);
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(specialValues[i], 200);
          console.info(msg + ` beginRecording with special width[${i}] succeeded`);
          console.info(msg + ` beginRecording with special setValue[${i}] :${specialValues[i]}`);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` beginRecording with special width[${i}] :${width}`);
          expect(width == specialValues[i]).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special width[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < specialValues.length; i++) {
        console.info(msg + ` beginRecording height special setValue[${i}] :${specialValues[i]}`);
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, specialValues[i]);
          console.info(msg + ` beginRecording height special height[${i}] succeeded`);
          console.info(msg + ` beginRecording height special setValue[${i}] :${specialValues[i]}`);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` beginRecording height special height[${i}] :${height}`);
          expect(height == specialValues[i]).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special height[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_STATIC_4900
     * @tc.desc   testBeginRecordingBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingBoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);
      let boundaryCases: Array<Array<int>> = [
        [1, 1], [1, 100], [100, 1], [100, 100], [500, 500], [1000, 1000], [10000, 10000]
      ];

      for (let i = 0; i < boundaryCases.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(boundaryCases[i][0], boundaryCases[i][1]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas!.attachPen(pen);
          recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas!.detachPen();
          let width = recordCmdUtils.getWidth();
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` boundary[${i}] width=${width}, height=${height}`);
          expect(width).assertEqual(boundaryCases[i][0]);
          expect(height).assertEqual(boundaryCases[i][1]);
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          expect(recordCmd != null && recordCmd != undefined).assertTrue();
          canvas.drawRecordCmd(recordCmd!);
          console.info(msg + ` boundary[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` boundary[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
  })
}

