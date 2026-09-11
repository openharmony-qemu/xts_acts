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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingTsRecordCmdUtilsTest(): void {
  describe('DrawingTsRecordCmdUtilsTest', () => {
    let pixel: image.PixelMap;

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
     * @tc.name   testDrawRecordCmdNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0100
     * @tc.desc   testDrawRecordCmdNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDrawRecordCmdNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testDrawRecordCmdNormal';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdEmptyRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0200
     * @tc.desc   testDrawRecordCmdEmptyRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdEmptyRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdEmptyRecording';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with empty recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultipleDrawCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0300
     * @tc.desc   testDrawRecordCmdMultipleDrawCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultipleDrawCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultipleDrawCalls';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas.drawRect({ left: 50, right: 100, top: 50, bottom: 100 });
        recordCanvas.drawCircle(50, 50, 30);
        recordCanvas.drawLine(0, 0, 100, 100);
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with multiple draw calls succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0400
     * @tc.desc   testDrawRecordCmdNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawRecordCmd(null);
        console.info(msg + ' drawRecordCmd null succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })

    /**
     * @tc.name   testDrawRecordCmdUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0500
     * @tc.desc   testDrawRecordCmdUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdUndefined';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawRecordCmd(undefined);
        console.info(msg + ' drawRecordCmd undefined succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultiplePlayback
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0600
     * @tc.desc   testDrawRecordCmdMultiplePlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultiplePlayback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultiplePlayback';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        for (let i = 0; i < 10; i++) {
          canvas.drawRecordCmd(recordCmd);
        }
        console.info(msg + ' drawRecordCmd multiple playback succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdDifferentCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0700
     * @tc.desc   testDrawRecordCmdDifferentCanvas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdDifferentCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdDifferentCanvas';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        let canvas1 = new drawing.Canvas(pixel);
        canvas1.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd on canvas1 succeeded');

        let canvas2 = new drawing.Canvas(pixel);
        canvas2.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd on canvas2 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0800
     * @tc.desc   testDrawRecordCmdWithBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithBrush';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas.attachBrush(brush);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachBrush();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_0900
     * @tc.desc   testDrawRecordCmdWithPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithPath';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
        recordCanvas.attachPen(pen);
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(90, 10);
        path.lineTo(90, 90);
        path.lineTo(10, 90);
        path.close();
        recordCanvas.drawPath(path);
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with path succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawColor
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1000
     * @tc.desc   testDrawRecordCmdWithDrawColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawColor', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawColor';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        recordCanvas.drawColor(0xFFFF0000);
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with drawColor succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawCircle
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1100
     * @tc.desc   testDrawRecordCmdWithDrawCircle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawCircle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawCircle';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 0, green: 0, blue: 255 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawCircle(50, 50, 30);
        recordCanvas.drawCircle(100, 100, 50);
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with drawCircle succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithDrawLine
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1200
     * @tc.desc   testDrawRecordCmdWithDrawLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithDrawLine', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithDrawLine';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(2);
        pen.setColor({ alpha: 255, red: 128, green: 128, blue: 128 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawLine(0, 0, 100, 100);
        recordCanvas.drawLine(100, 0, 0, 100);
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with drawLine succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithPenAndBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1300
     * @tc.desc   testDrawRecordCmdWithPenAndBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithPenAndBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithPenAndBrush';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas.attachBrush(brush);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        recordCanvas.detachBrush();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with pen and brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithRoundRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1400
     * @tc.desc   testDrawRecordCmdWithRoundRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithRoundRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithRoundRect';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        let roundRect = new drawing.RoundRect({ left: 10, top: 10, right: 90, bottom: 90 }, 10, 10);
        recordCanvas.drawRoundRect(roundRect);
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with roundRect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdReplayAfterDraw
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1500
     * @tc.desc   testDrawRecordCmdReplayAfterDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdReplayAfterDraw', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdReplayAfterDraw';
      let canvas = new drawing.Canvas(pixel);
      try {
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        canvas.attachPen(pen);
        canvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        canvas.detachPen();

        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let recordPen = new drawing.Pen();
        recordPen.setStrokeWidth(3);
        recordPen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(recordPen);
        recordCanvas.drawRect({ left: 50, right: 100, top: 50, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd replay after draw succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdWithSaveRestore
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1600
     * @tc.desc   testDrawRecordCmdWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdWithSaveRestore', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdWithSaveRestore';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        recordCanvas.save();
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas.detachPen();
        recordCanvas.restore();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' drawRecordCmd with save/restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdChainingPlayback
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1700
     * @tc.desc   testDrawRecordCmdChainingPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdChainingPlayback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdChainingPlayback';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        for (let i = 0; i < 20; i++) {
          let tmpCanvas = new drawing.Canvas(pixel);
          tmpCanvas.drawRecordCmd(recordCmd);
        }
        console.info(msg + ' drawRecordCmd chaining playback succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1800
     * @tc.desc   testFinishRecordingNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinishRecordingNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFinishRecordingNormal';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' finishRecording succeeded and returned valid RecordCmd');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingEmptyRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_1900
     * @tc.desc   testFinishRecordingEmptyRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingEmptyRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingEmptyRecording';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' finishRecording with empty recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingReturnReusable
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2000
     * @tc.desc   testFinishRecordingReturnReusable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingReturnReusable', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingReturnReusable';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();

        for (let i = 0; i < 5; i++) {
          let tmpCanvas = new drawing.Canvas(pixel);
          tmpCanvas.drawRecordCmd(recordCmd);
        }
        console.info(msg + ' finishRecording return value reusable succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingComplexRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2100
     * @tc.desc   testFinishRecordingComplexRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingComplexRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingComplexRecording';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(3);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas.attachBrush(brush);
        recordCanvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas.drawCircle(100, 100, 30);
        recordCanvas.drawLine(0, 0, 200, 200);
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(90, 10);
        path.lineTo(90, 90);
        path.close();
        recordCanvas.drawPath(path);
        let roundRect = new drawing.RoundRect({ left: 20, top: 20, right: 80, bottom: 80 }, 5, 5);
        recordCanvas.drawRoundRect(roundRect);
        recordCanvas.drawColor(0x800000FF);
        recordCanvas.detachPen();
        recordCanvas.detachBrush();
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' finishRecording with complex recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2200
     * @tc.desc   testGetHeightNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHeightNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testGetHeightNormal';
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
     * @tc.name   testGetHeightBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2300
     * @tc.desc   testGetHeightBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightBoundaryValue';
      let heights: Array<number> = [1, 1, 500, 1000, 10000];
      let widths: Array<number> = [1, 200, 500, 1000, 10000];

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
        recordCmdUtils.beginRecording(Number.MAX_VALUE, Number.MAX_VALUE);
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
     * @tc.name   testGetHeightAfterFinishRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2400
     * @tc.desc   testGetHeightAfterFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightAfterFinishRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightAfterFinishRecording';
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
     * @tc.name   testGetHeightMultipleSizes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2500
     * @tc.desc   testGetHeightMultipleSizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightMultipleSizes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightMultipleSizes';
      let testHeights: Array<number> = [50, 100, 200, 500, 800];

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
     * @tc.name   testGetHeightExtremeValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2600
     * @tc.desc   testGetHeightExtremeValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightExtremeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightExtremeValue';
      let extremeHeights: Array<number> = [10000, 60000, 100000];

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
     * @tc.name   testGetHeightFloatInput
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2700
     * @tc.desc   testGetHeightFloatInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightFloatInput', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightFloatInput';
      let floatHeights: Array<number> = [100.5, 99.9, 100.1];
      let expectedHeights: Array<number> = [100, 99, 100];

      for (let i = 0; i < floatHeights.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, floatHeights[i]);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` getHeight float[${i}]=${height}, expected=${expectedHeights[i]}`);
          expect(height).assertEqual(expectedHeights[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getHeight float[${i}] succeeded (floored)`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getHeight float[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testGetWidthNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2800
     * @tc.desc   testGetWidthNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWidthNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testGetWidthNormal';
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
     * @tc.name   testGetWidthBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_2900
     * @tc.desc   testGetWidthBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthBoundaryValue';
      let widths: Array<number> = [1, 200, 500, 1000, 10000];
      let heights: Array<number> = [1, 1, 500, 1000, 10000];

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
     * @tc.name   testGetWidthAfterFinishRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3000
     * @tc.desc   testGetWidthAfterFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthAfterFinishRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthAfterFinishRecording';
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
     * @tc.name   testGetWidthMultipleSizes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3100
     * @tc.desc   testGetWidthMultipleSizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthMultipleSizes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthMultipleSizes';
      let testWidths: Array<number> = [50, 100, 200, 500, 800];

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
     * @tc.name   testGetWidthExtremeValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3200
     * @tc.desc   testGetWidthExtremeValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthExtremeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthExtremeValue';
      let extremeWidths: Array<number> = [10000, 60000, 100000];

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
     * @tc.name   testGetWidthFloatInput
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3300
     * @tc.desc   testGetWidthFloatInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthFloatInput', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthFloatInput';
      let floatWidths: Array<number> = [100.5, 99.9, 100.1];
      let expectedWidths: Array<number> = [100, 99, 100];

      for (let i = 0; i < floatWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(floatWidths[i], 200);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` getWidth float[${i}]=${width}, expected=${expectedWidths[i]}`);
          expect(width).assertEqual(expectedWidths[i]);
          recordCmdUtils.finishRecording();
          console.info(msg + ` getWidth float[${i}] succeeded (floored)`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getWidth float[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testGetWidthGetHeightCombined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3400
     * @tc.desc   testGetWidthGetHeightCombined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthGetHeightCombined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthGetHeightCombined';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, 100);
        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getWidth=${width}, getHeight=${height}`);
        expect(width).assertEqual(200);
        expect(height).assertEqual(100);
        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' getWidth/getHeight combined succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRecordCmdUtilsFullWorkflow
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3500
     * @tc.desc   testRecordCmdUtilsFullWorkflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsFullWorkflow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRecordCmdUtilsFullWorkflow';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(300, 150);
        expect(recordCanvas != null && recordCanvas != undefined).assertTrue();

        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        expect(width).assertEqual(300);
        expect(height).assertEqual(150);

        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();

        let recordCmd = recordCmdUtils.finishRecording();
        expect(recordCmd != null && recordCmd != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd);
        console.info(msg + ' full workflow succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRecordCmdUtilsMultipleInstances
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3600
     * @tc.desc   testRecordCmdUtilsMultipleInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRecordCmdUtilsMultipleInstances', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRecordCmdUtilsMultipleInstances';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils1 = new drawing.RecordCmdUtils();
        let recordCanvas1 = recordCmdUtils1.beginRecording(200, 200);
        let pen1 = new drawing.Pen();
        pen1.setStrokeWidth(5);
        pen1.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas1.attachPen(pen1);
        recordCanvas1.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas1.detachPen();
        let width1 = recordCmdUtils1.getWidth();
        let height1 = recordCmdUtils1.getHeight();
        expect(width1).assertEqual(200);
        expect(height1).assertEqual(200);
        let recordCmd1 = recordCmdUtils1.finishRecording();
        expect(recordCmd1 != null && recordCmd1 != undefined).assertTrue();

        let recordCmdUtils2 = new drawing.RecordCmdUtils();
        let recordCanvas2 = recordCmdUtils2.beginRecording(150, 100);
        let pen2 = new drawing.Pen();
        pen2.setStrokeWidth(3);
        pen2.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas2.attachPen(pen2);
        recordCanvas2.drawCircle(50, 50, 30);
        recordCanvas2.detachPen();
        let width2 = recordCmdUtils2.getWidth();
        let height2 = recordCmdUtils2.getHeight();
        expect(width2).assertEqual(150);
        expect(height2).assertEqual(100);
        let recordCmd2 = recordCmdUtils2.finishRecording();
        expect(recordCmd2 != null && recordCmd2 != undefined).assertTrue();

        canvas.drawRecordCmd(recordCmd1);
        canvas.drawRecordCmd(recordCmd2);
        console.info(msg + ' multiple RecordCmdUtils instances succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testDrawRecordCmdMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3700
     * @tc.desc   testDrawRecordCmdMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDrawRecordCmdMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testDrawRecordCmdMultipleCalls';
      let canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i++) {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas = recordCmdUtils.beginRecording(200, 200);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(i + 1);
          pen.setColor({ alpha: 255, red: i * 10, green: 0, blue: 0 });
          recordCanvas.attachPen(pen);
          recordCanvas.drawRect({ left: 0, right: i * 5, top: 0, bottom: i * 5 });
          recordCanvas.detachPen();
          let recordCmd = recordCmdUtils.finishRecording();
          expect(recordCmd != null && recordCmd != undefined).assertTrue();
          canvas.drawRecordCmd(recordCmd);
        }
        console.info(msg + ' drawRecordCmd multiple calls succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetHeightMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_3900
     * @tc.desc   testGetHeightMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightMinValue';
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
     * @tc.name   testGetWidthMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_4000
     * @tc.desc   testGetWidthMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthMinValue';
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
     * @tc.name   testFinishRecordingWithoutBeginRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_4700
     * @tc.desc   testFinishRecordingWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingWithoutBeginRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingWithoutBeginRecording';
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCmd = recordCmdUtils.finishRecording();
        console.info(msg + ` finishRecording without beginRecording returned: ${recordCmd}`);
        expect(recordCmd == null || recordCmd == undefined).assertTrue();
        console.info(msg + ' finishRecording without beginRecording handled gracefully');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` finishRecording without beginRecording errorCode is: ${e.code} + errormsg is: ${e.message}`);
        console.info(msg + ' finishRecording without beginRecording threw error as expected');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFinishRecordingDoubleCall
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_4800
     * @tc.desc   testFinishRecordingDoubleCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFinishRecordingDoubleCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFinishRecordingDoubleCall';
      let canvas = new drawing.Canvas(pixel);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas.attachPen(pen);
        recordCanvas.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas.detachPen();

        let recordCmd1 = recordCmdUtils.finishRecording();
        expect(recordCmd1 != null && recordCmd1 != undefined).assertTrue();
        canvas.drawRecordCmd(recordCmd1);
        console.info(msg + ' first finishRecording succeeded');

        try {
          let recordCmd2 = recordCmdUtils.finishRecording();
          console.info(msg + ` second finishRecording returned: ${recordCmd2}`);
          if (recordCmd2 != null && recordCmd2 != undefined) {
            canvas.drawRecordCmd(recordCmd2);
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
     * @tc.name   testGetHeightWithoutBeginRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_4900
     * @tc.desc   testGetHeightWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightWithoutBeginRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightWithoutBeginRecording';
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
     * @tc.name   testGetWidthWithoutBeginRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5000
     * @tc.desc   testGetWidthWithoutBeginRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthWithoutBeginRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthWithoutBeginRecording';
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
     * @tc.name   testGetWidthGetHeightWithoutBeginRecordingCombined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5100
     * @tc.desc   testGetWidthGetHeightWithoutBeginRecordingCombined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthGetHeightWithoutBeginRecordingCombined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthGetHeightWithoutBeginRecordingCombined';
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
     * @tc.name   testGetHeightAfterDoubleFinishRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5200
     * @tc.desc   testGetHeightAfterDoubleFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHeightAfterDoubleFinishRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetHeightAfterDoubleFinishRecording';
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
     * @tc.name   testGetWidthAfterDoubleFinishRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5300
     * @tc.desc   testGetWidthAfterDoubleFinishRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWidthAfterDoubleFinishRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testGetWidthAfterDoubleFinishRecording';
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
     * @tc.name   testBeginRecordingBothNegative
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5800
     * @tc.desc   testBeginRecordingBothNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingBothNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingBothNegative';
      let negWidths: Array<number> = [-1, -100, -1000, -10000];
      let negHeights: Array<number> = [-1, -100, -1000, -10000];

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
     * @tc.name   testBeginRecordingExtremeMaxValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5900
     * @tc.desc   testBeginRecordingExtremeMaxValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingExtremeMaxValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingExtremeMaxValue';
      let canvas = new drawing.Canvas(pixel);
      let extremeWidths: Array<number> = [10000, 60000, 100000, 500000];
      let extremeHeights: Array<number> = [10000, 60000, 100000, 500000];

      for (let i = 0; i < extremeWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas = recordCmdUtils.beginRecording(extremeWidths[i], extremeHeights[i]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas.attachPen(pen);
          recordCanvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas.detachPen();
          let width = recordCmdUtils.getWidth();
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` extreme max[${i}] succeeded, width=${width}, height=${height}`);
          expect(width).assertEqual(extremeWidths[i]);
          expect(height).assertEqual(extremeHeights[i]);
          let recordCmd = recordCmdUtils.finishRecording();
          canvas.drawRecordCmd(recordCmd);
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
     * @tc.name   testBeginRecordingExtremeMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6000
     * @tc.desc   testBeginRecordingExtremeMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingExtremeMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingExtremeMinValue';
      let negMaxValue: number = -Number.MAX_VALUE;
      let negSafeInteger: number = -Number.MAX_SAFE_INTEGER;
      let extremeWidths: Array<number> = [-100, -1000, -10000, negSafeInteger, negMaxValue];
      let extremeHeights: Array<number> = [-100, -1000, -10000, negSafeInteger, negMaxValue];

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
     * @tc.name   testBeginRecordingZeroValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6100
     * @tc.desc   testBeginRecordingZeroValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingZeroValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingZeroValue';
      let zeroCases: Array<Array<number>> = [[0, 200], [200, 0], [0, 0]];

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
     * @tc.name   testBeginRecordingSpecialNumberValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6200
     * @tc.desc   testBeginRecordingSpecialNumberValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingSpecialNumberValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingSpecialNumberValue';
      let specialValues: Array<number> = [Number.MIN_VALUE, -1, -10, -100, -1000, -10000, -50000, NaN, -Infinity, -Number.MIN_VALUE, -Number.MAX_VALUE];

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
     * @tc.name   testBeginRecordingSpecialNumberValue2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_5400
     * @tc.desc   testBeginRecordingSpecialNumberValue2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingSpecialNumberValue2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingSpecialNumberValue2';
      let specialValues: Array<number> = [Number.MAX_VALUE, Infinity];

      for (let i = 0; i < specialValues.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(specialValues[i], 200);
          console.info(msg + ` beginRecording with special width[${i}] succeeded`);
          console.info(msg + ` beginRecording with special width[${i}] :${specialValues[i]}`);
          let width = recordCmdUtils.getWidth();
          expect(Math.abs(width - 2147483520) < 0.01).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special width[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < specialValues.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(200, specialValues[i]);
          console.info(msg + ` beginRecording with special height[${i}] succeeded`);
          console.info(msg + ` beginRecording with special width[${i}] :${specialValues[i]}`);
          let height = recordCmdUtils.getHeight();
          expect(Math.abs(height - 2147483520) < 0.01).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with special height[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingNullUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6300
     * @tc.desc   testBeginRecordingNullUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingNullUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingNullUndefined';

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(null, 200);
        console.info(msg + ' beginRecording with null width succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with null width errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, null);
        console.info(msg + ' beginRecording with null height succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with null height errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(undefined, 200);
        console.info(msg + ' beginRecording with undefined width succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with undefined width errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(200, undefined);
        console.info(msg + ' beginRecording with undefined height succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with undefined height errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(null, null);
        console.info(msg + ' beginRecording with both null succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with both null errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        recordCmdUtils.beginRecording(undefined, undefined);
        console.info(msg + ' beginRecording with both undefined succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` beginRecording with both undefined errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })

    /**
     * @tc.name   testBeginRecordingBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6500
     * @tc.desc   testBeginRecordingBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingBoundaryValue';
      let canvas = new drawing.Canvas(pixel);
      let boundaryCases: Array<Array<number>> = [
        [1, 1], [1, 100], [100, 1], [100, 100], [500, 500], [1000, 1000], [10000, 10000]
      ];

      for (let i = 0; i < boundaryCases.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas = recordCmdUtils.beginRecording(boundaryCases[i][0], boundaryCases[i][1]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas.attachPen(pen);
          recordCanvas.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas.detachPen();
          let width = recordCmdUtils.getWidth();
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` boundary[${i}] width=${width}, height=${height}`);
          expect(width).assertEqual(boundaryCases[i][0]);
          expect(height).assertEqual(boundaryCases[i][1]);
          let recordCmd = recordCmdUtils.finishRecording();
          expect(recordCmd != null && recordCmd != undefined).assertTrue();
          canvas.drawRecordCmd(recordCmd);
          console.info(msg + ` boundary[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` boundary[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testBeginRecordingFloatValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_RECORDCMDUTILS_6600
     * @tc.desc   testBeginRecordingFloatValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBeginRecordingFloatValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBeginRecordingFloatValue';
      let canvas = new drawing.Canvas(pixel);
      let floatWidths: Array<number> = [100.5, 99.9, 100.1, 0.5, 0.9, 1.5];
      let expectedWidths: Array<number> = [100, 99, 100, 0, 0, 1];
      let floatHeights: Array<number> = [100.5, 99.9, 100.1, 0.5, 0.9, 1.5];
      let expectedHeights: Array<number> = [100, 99, 100, 0, 0, 1];

      for (let i = 0; i < floatWidths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(floatWidths[i], 100);
          let width = recordCmdUtils.getWidth();
          console.info(msg + ` float width[${i}] input=${floatWidths[i]}, getWidth=${width}, expected=${expectedWidths[i]}`);
          expect(width).assertEqual(expectedWidths[i]);
          recordCmdUtils.finishRecording();
          if (expectedWidths[i] <= 0) {
            expect().assertFail();
          }
          console.info(msg + ` float width[${i}] succeeded (floored)`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` float width[${i}] input=${floatWidths[i]} errorCode is: ${e.code} + errormsg is: ${e.message}`);
          if (expectedWidths[i] > 0) {
            expect().assertFail();
          } else {
            expect(e.code).assertEqual(25900001);
          }
        }
      }

      for (let i = 0; i < floatHeights.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          recordCmdUtils.beginRecording(100, floatHeights[i]);
          let height = recordCmdUtils.getHeight();
          console.info(msg + ` float height[${i}] input=${floatHeights[i]}, getHeight=${height}, expected=${expectedHeights[i]}`);
          expect(height).assertEqual(expectedHeights[i]);
          recordCmdUtils.finishRecording();
          if (expectedHeights[i] <= 0) {
            expect().assertFail();
          }
          console.info(msg + ` float height[${i}] succeeded (floored)`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` float height[${i}] input=${floatHeights[i]} errorCode is: ${e.code} + errormsg is: ${e.message}`);
          if (expectedHeights[i] > 0) {
            expect().assertFail();
          } else {
            expect(e.code).assertEqual(25900001);
          }
        }
      }
    })
  })
}

