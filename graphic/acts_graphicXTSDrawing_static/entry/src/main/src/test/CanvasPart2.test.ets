/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { getEnumCount } from './Util.test';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart2Test() {
  describe('DrawingTsCanvasPart2Test', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
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
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1000
     * @tc.name      : testCanvasDrawTextBlobNormalStatic
     * @tc.desc      : testCanvasDrawTextBlobNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawTextBlobNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawTextBlobNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob((textBlob as drawing.TextBlob), 20, 20);
        canvas.drawTextBlob((textBlob as drawing.TextBlob), 2, 5);
        canvas.drawTextBlob((textBlob as drawing.TextBlob), -10, -10);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1003
     * @tc.name      : testCanvasDrawTextBlobMultipleCallsStatic
     * @tc.desc      : testCanvasDrawTextBlobMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawTextBlobMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawTextBlobMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        for (let index = 0; index < 20; index++) {
          canvas.drawTextBlob((textBlob as drawing.TextBlob), Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1100
     * @tc.name      : testCanvasAttachPenDetachPenNormalStatic
     * @tc.desc      : testCanvasAttachPenDetachPenNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasAttachPenDetachPenNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasAttachPenDetachPenNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1103
     * @tc.name      : testCanvasAttachPenDetachPenMultipleCallsStatic
     * @tc.desc      : testCanvasAttachPenDetachPenMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenDetachPenMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasAttachPenDetachPenMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        for (let index = 0; index < 20; index++) {
          canvas.attachPen(pen);
        }
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        for (let index = 0; index < 20; index++) {
          canvas.detachPen();
        }
        for (let index = 0; index < 20; index++) {
          canvas.attachPen(pen);
          canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
          canvas.detachPen();
        }
        console.info(msg + 'attachPen successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1104
     * @tc.name      : testCanvasAttachPenOlyStatic
     * @tc.desc      : testCanvasAttachPenOlyStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenOlyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasAttachPenOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        console.info(msg + 'attachPen successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1105
     * @tc.name      : testCanvasDttachPenOlyStatic
     * @tc.desc      : testCanvasDttachPenOlyStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDttachPenOlyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDttachPenOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1200
     * @tc.name      : testCanvasAttachBrushDetachBrushNormalStatic
     * @tc.desc      : testCanvasAttachBrushDetachBrushNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasAttachBrushDetachBrushNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasAttachBrushDetachBrushNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush(brush);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1203
     * @tc.name      : testCanvasAttachBrushDetachBrushMultipleCallsStatic
     * @tc.desc      : testCanvasAttachBrushDetachBrushMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushDetachBrushMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasAttachBrushDetachBrushMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
        }
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        for (let index = 0; index < 20; index++) {
          canvas.detachBrush();
        }
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
          canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
          canvas.detachBrush();
        }
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1204
     * @tc.name      : testCanvasAttachBrushOlyStatic
     * @tc.desc      : testCanvasAttachBrushOlyStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushOlyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasAttachBrushOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush(brush);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1205
     * @tc.name      : testCanvasDttachBrushOlyStatic
     * @tc.desc      : testCanvasDttachBrushOlyStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDttachBrushOlyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDttachBrushOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1300
     * @tc.name      : testCanvasClipPathNormalStatic
     * @tc.desc      : testCanvasClipPathNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipPathNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClipPathNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, false);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE);
        canvas.clipPath(path);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1301
     * @tc.name      : testCanvasClipPathNullStatic
     * @tc.desc      : testCanvasClipPathNullStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipPathNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipPathNullStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255,
          red: 255,
          green: 0,
          blue: 0
        });
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, undefined, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255,
          red: 255,
          green: 0,
          blue: 0
        });
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, undefined);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1303
     * @tc.name      : testCanvasClipPathMultipleCallsStatic
     * @tc.desc      : testCanvasClipPathMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipPathMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipPathMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          let path = new drawing.Path();
          path.moveTo(10, 10);
          path.cubicTo(Math.random() * Number.MAX_VALUE, 10, 10, 10, 15, 15);
          path.close();
          canvas.clipPath(path, drawing.ClipOp.INTERSECT, Math.random() == 1 ? true : false);
          canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, Math.random() == 1 ? false : true);
        }
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1400
     * @tc.name      : testCanvasClipRectNormalStatic
     * @tc.desc      : testCanvasClipRectNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClipRectNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.INTERSECT, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.INTERSECT, false);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.clipRect({ left : 100.32, right : 100.5, top : 400.2, bottom : 400.3 }, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({ left : 0, right : 0, top : 0, bottom : 100}, drawing.ClipOp.INTERSECT, true);
        canvas.clipRect({ left : 0, right : 100, top : 100, bottom : 100}, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipRect({ left : 100, right : 100, top : 100, bottom : 100}, drawing.ClipOp.INTERSECT, false);
        canvas.clipRect({ left : -100, right : 100, top : -100, bottom : 100});
        canvas.clipRect({ left : 100, right : -100, top : 100, bottom : -100}, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1401
     * @tc.name      : testCanvasClipRectNullStatic
     * @tc.desc      : testCanvasClipRectNullStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRectNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRectNullStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, undefined, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, undefined);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1403
     * @tc.name      : testCanvasClipRectMultipleCallsStatic
     * @tc.desc      : testCanvasClipRectMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRectMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawCircle(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
          canvas.clipRect({left : Math.random() * Number.MAX_VALUE, right : Math.random() * Number.MAX_VALUE, top : Math.random() * Number.MAX_VALUE, bottom : Math.random() * Number.MAX_VALUE}, drawing.ClipOp.DIFFERENCE, Math.random() == 1 ? true : false);
        }
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1500
     * @tc.name      : testCanvasSaveGetSaveCountNormalStatic
     * @tc.desc      : testCanvasSaveGetSaveCountNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSaveGetSaveCountNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSaveGetSaveCountNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        let rect: common2D.Rect = {left: 10, right: 200, top: 100, bottom: 300};
        canvas.drawRect(rect);
        let saveCount = canvas.save();
        let readCount = canvas.getSaveCount();
        canvas.restore();
        expect(saveCount + 1 == readCount).assertTrue();
        canvas.scale(2, 0.5);
        canvas.skew(0.1, 0.1);
        canvas.rotate(30, 100, 100);
        canvas.translate(10, 10);
        let saveCount2 = canvas.save();
        readCount = canvas.getSaveCount();
        canvas.restore();
        expect(saveCount + 1 == readCount).assertTrue();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `save、getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1502
     * @tc.name      : testCanvasSaveGetSaveCountMultipleCallsStatic
     * @tc.desc      : testCanvasSaveGetSaveCountMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSaveGetSaveCountMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSaveGetSaveCountMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        let rect: common2D.Rect = {left: 10, right: 200, top: 100, bottom: 300};
        canvas.drawRect(rect);
        for (let index = 0; index < 20; index++) {
          canvas.save();
        }
        for (let index = 0; index < 20; index++) {
          canvas.getSaveCount();
        }
        for (let index = 0; index < 20; index++) {
          canvas.save();
          canvas.getSaveCount();
        }
        canvas.restore();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `save、getSaveCount errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1503
     * @tc.name      : testCanvasGetSaveCountWhenNoSaveStatic
     * @tc.desc      : testCanvasGetSaveCountWhenNoSaveStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasGetSaveCountWhenNoSaveStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasGetSaveCountWhenNoSaveStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        let readCount = canvas.getSaveCount();
        expect(1 == readCount).assertTrue();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `save、getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1600
     * @tc.name      : testCanvasScaleNormalStatic
     * @tc.desc      : testCanvasScaleNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasScaleNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasScaleNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(2, 2);
        canvas.scale(0.5, 0.5);
        canvas.scale(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1603
     * @tc.name      : testCanvasScaleMultipleCallsStatic
     * @tc.desc      : testCanvasScaleMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasScaleMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasScaleMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.scale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1700
     * @tc.name      : testCanvasSkewNormalStatic
     * @tc.desc      : testCanvasSkewNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSkewNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSkewNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(2, 2);
        canvas.skew(0.5, 0.5);
        canvas.skew(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1703
     * @tc.name      : testCanvasSkewMultipleCallsStatic
     * @tc.desc      : testCanvasSkewMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSkewMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSkewMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.skew(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1800
     * @tc.name      : testCanvasRotateNormalStatic
     * @tc.desc      : testCanvasRotateNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasRotateNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasRotateNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 100, 100);
        canvas.rotate(30.1, 100.1, 100.1);
        canvas.rotate(0, 100, 100);
        canvas.rotate(360, 100, 100);
        canvas.rotate(-90, 100, 100);
        canvas.rotate(400, 100, 100);
        canvas.rotate(30, -100, -100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1803
     * @tc.name      : testCanvasRotateMultipleCallsStatic
     * @tc.desc      : testCanvasRotateMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRotateMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasRotateMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.rotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1900
     * @tc.name      : testCanvasTranlateNormalStatic
     * @tc.desc      : testCanvasTranlateNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasTranlateNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasTranlateNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10, 10);
        canvas.translate(10.1, 10.1);
        canvas.translate(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1903
     * @tc.name      : testCanvasTranlateMultipleCallsStatic
     * @tc.desc      : testCanvasTranlateMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasTranlateMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasTranlateMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.translate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}