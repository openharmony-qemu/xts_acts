/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart9Test(): void {
  describe('DrawingTsCanvasPart9Test', () => {
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
     * @tc.name   testCanvasResetClipNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5600
     * @tc.desc   testCanvasResetClipNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetClipNormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasResetClipNormal1Static';
      let canvas = new drawing.Canvas(pixel!);
      try {
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5601
     * @tc.desc   testCanvasResetClipNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasResetClipNormal2Static';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10.0, top: 100.0, right: 200.0, bottom: 300.0 };
      try {
        canvas.clipRect(rect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + "clipRect success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5602
     * @tc.desc   testCanvasResetClipNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipNormal3Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasResetClipNormal3Static';
      let canvas = new drawing.Canvas(pixel!);
      let path = new drawing.Path();
      path.addCircle(50.0, 50.0, 30.0, drawing.PathDirection.CLOCKWISE);
      try {
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        console.log(msg + "clipPath success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5603
     * @tc.desc   testCanvasResetClipMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipMultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 10; i++) {
          canvas.resetClip();
          console.log(msg + "resetClip success step: " + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithMatrixStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5604
     * @tc.desc   testCanvasResetClipWithMatrixStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithMatrixStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipWithMatrixStatic';
      let canvas = new drawing.Canvas(pixel!);
      let matrix = new drawing.Matrix();
      matrix.setMatrix([2.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1.0]);
      try {
        canvas.setMatrix(matrix);
        console.log(msg + "setMatrix success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterDrawStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5605
     * @tc.desc   testCanvasResetClipAfterDrawStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipAfterDrawStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasResetClipAfterDrawStatic';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10.0, top: 10.0, right: 50.0, bottom: 50.0 };
      try {
        canvas.drawRect(rect);
        console.log(msg + "drawRect success");
        canvas.resetClip();
        console.log(msg + "resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `resetClip errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}
