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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function DrawingTsCanvasPart11Test(): void {
  describe('DrawingTsCanvasPart11Test', () => {
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
     * @tc.name   testCanvasDrawRecordCmdNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0100
     * @tc.desc   testCanvasDrawRecordCmdNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRecordCmdNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawRecordCmdNormal';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdEmptyRecording
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0200
     * @tc.desc   testCanvasDrawRecordCmdEmptyRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdEmptyRecording', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdEmptyRecording';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with empty recording succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdMultipleDrawCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0300
     * @tc.desc   testCanvasDrawRecordCmdMultipleDrawCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdMultipleDrawCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdMultipleDrawCalls';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with multiple draw calls succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdMultiplePlayback
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0700
     * @tc.desc   testCanvasDrawRecordCmdMultiplePlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdMultiplePlayback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdMultiplePlayback';
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
     * @tc.name   testCanvasDrawRecordCmdDifferentCanvas
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0800
     * @tc.desc   testCanvasDrawRecordCmdDifferentCanvas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdDifferentCanvas', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdDifferentCanvas';
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
     * @tc.name   testCanvasDrawRecordCmdWithBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_0900
     * @tc.desc   testCanvasDrawRecordCmdWithBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithBrush';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1000
     * @tc.desc   testCanvasDrawRecordCmdWithPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithPath';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with path succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdBeginRecordingBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1100
     * @tc.desc   testCanvasDrawRecordCmdBeginRecordingBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdBeginRecordingBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdBeginRecordingBoundaryValue';
      let canvas = new drawing.Canvas(pixel!);
      let widths: Array<int> = [1, 1, 100, 500, 1000];
      let heights: Array<int> = [1, 100, 1, 500, 1000];

      for (let i = 0; i < widths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(widths[i], heights[i]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas!.attachPen(pen);
          recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas!.detachPen();
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          canvas.drawRecordCmd(recordCmd!);
          console.info(msg + ` drawRecordCmd with size[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` drawRecordCmd with size[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdBeginRecordingOutOfRange
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1200
     * @tc.desc   testCanvasDrawRecordCmdBeginRecordingOutOfRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdBeginRecordingOutOfRange', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdBeginRecordingOutOfRange';
      let widths: Array<int> = [0, 100, 0, -1, 100, -100];
      let heights: Array<int> = [100, 0, 0, 100, -1, -100];

      for (let i = 0; i < widths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(widths[i], heights[i]);
          console.info(msg + ` beginRecording with out-of-range size[${i}] succeeded`);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` beginRecording with out-of-range size[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(25900001);
        }
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdGetWidthGetHeight
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1400
     * @tc.desc   testCanvasDrawRecordCmdGetWidthGetHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdGetWidthGetHeight', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdGetWidthGetHeight';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 100);
        let width = recordCmdUtils.getWidth();
        let height = recordCmdUtils.getHeight();
        console.info(msg + ` getWidth=${width}, getHeight=${height}`);
        expect(width).assertEqual(200);
        expect(height).assertEqual(100);
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with getWidth/getHeight succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdMultipleRecordCmdUtils
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1500
     * @tc.desc   testCanvasDrawRecordCmdMultipleRecordCmdUtils
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdMultipleRecordCmdUtils', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdMultipleRecordCmdUtils';
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
        let recordCmd1: drawing.RecordCmd | undefined = recordCmdUtils1.finishRecording();

        let recordCmdUtils2 = new drawing.RecordCmdUtils();
        let recordCanvas2: drawing.Canvas | undefined = recordCmdUtils2.beginRecording(200, 200);
        let pen2 = new drawing.Pen();
        pen2.setStrokeWidth(3);
        pen2.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
        recordCanvas2!.attachPen(pen2);
        recordCanvas2!.drawCircle(50, 50, 30);
        recordCanvas2!.detachPen();
        let recordCmd2: drawing.RecordCmd | undefined = recordCmdUtils2.finishRecording();

        canvas.drawRecordCmd(recordCmd1!);
        canvas.drawRecordCmd(recordCmd2!);
        console.info(msg + ' drawRecordCmd with multiple RecordCmdUtils succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdChainingPlayback
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1600
     * @tc.desc   testCanvasDrawRecordCmdChainingPlayback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdChainingPlayback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdChainingPlayback';
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
     * @tc.name   testCanvasDrawRecordCmdWithDrawColor
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1700
     * @tc.desc   testCanvasDrawRecordCmdWithDrawColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithDrawColor', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithDrawColor';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        recordCanvas!.drawColor(0xFFFF0000.toInt());
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawColor succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithDrawCircle
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1800
     * @tc.desc   testCanvasDrawRecordCmdWithDrawCircle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithDrawCircle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithDrawCircle';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawCircle succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithDrawLine
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_1900
     * @tc.desc   testCanvasDrawRecordCmdWithDrawLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithDrawLine', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithDrawLine';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with drawLine succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawRecordCmdWithPenAndBrush
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2200
     * @tc.desc   testCanvasDrawRecordCmdWithPenAndBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithPenAndBrush', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithPenAndBrush';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with pen and brush succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdBeginRecordingExtremeValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2300
     * @tc.desc   testCanvasDrawRecordCmdBeginRecordingExtremeValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdBeginRecordingExtremeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdBeginRecordingExtremeValue';
      let canvas = new drawing.Canvas(pixel!);
      let heightMax = (Number.MAX_VALUE).toInt();
      let widthMax = (Number.MAX_VALUE).toInt();
      let widths: Array<int> = [10000, 60000, widthMax];
      let heights: Array<int> = [10000, 60000, heightMax];

      for (let i = 0; i < widths.length; i++) {
        try {
          let recordCmdUtils = new drawing.RecordCmdUtils();
          let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(widths[i], heights[i]);
          let pen = new drawing.Pen();
          pen.setStrokeWidth(2);
          pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
          recordCanvas!.attachPen(pen);
          recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
          recordCanvas!.detachPen();
          let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
          canvas.drawRecordCmd(recordCmd!);
          console.info(msg + ` drawRecordCmd with extreme size[${i}] succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` drawRecordCmd with extreme size[${i}] errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithRoundRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2400
     * @tc.desc   testCanvasDrawRecordCmdWithRoundRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithRoundRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithRoundRect';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with roundRect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2500
     * @tc.desc   testCanvasDrawRecordCmdMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdMultipleCalls';
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
     * @tc.name   testCanvasDrawRecordCmdReplayAfterDraw
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2600
     * @tc.desc   testCanvasDrawRecordCmdReplayAfterDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdReplayAfterDraw', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdReplayAfterDraw';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd replay after draw succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithClip
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2700
     * @tc.desc   testCanvasDrawRecordCmdWithClip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithClip', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithClip';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let brush = new drawing.Brush();
        brush.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachBrush(brush);
        recordCanvas!.drawRect({ left: 0, right: 100, top: 0, bottom: 100 });
        recordCanvas!.detachBrush();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with clip succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2800
     * @tc.desc   testCanvasDrawRecordCmdWithTransform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithTransform';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas | undefined = recordCmdUtils.beginRecording(200, 200);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 50, top: 0, bottom: 50 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with transform succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdWithSaveRestore
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_2900
     * @tc.desc   testCanvasDrawRecordCmdWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdWithSaveRestore', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdWithSaveRestore';
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
        canvas.drawRecordCmd(recordCmd!);
        console.info(msg + ' drawRecordCmd with save/restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRecordCmdBeginRecordingMinValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_CMD_3000
     * @tc.desc   testCanvasDrawRecordCmdBeginRecordingMinValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRecordCmdBeginRecordingMinValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRecordCmdBeginRecordingMinValue';
      let canvas = new drawing.Canvas(pixel!);
      try {
        let recordCmdUtils = new drawing.RecordCmdUtils();
        let recordCanvas: drawing.Canvas  | undefined = recordCmdUtils.beginRecording(1, 1);
        let pen = new drawing.Pen();
        pen.setStrokeWidth(1);
        pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        recordCanvas!.attachPen(pen);
        recordCanvas!.drawRect({ left: 0, right: 1, top: 0, bottom: 1 });
        recordCanvas!.detachPen();
        let recordCmd: drawing.RecordCmd | undefined = recordCmdUtils.finishRecording();
        canvas.drawRecordCmd(recordCmd!);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}
