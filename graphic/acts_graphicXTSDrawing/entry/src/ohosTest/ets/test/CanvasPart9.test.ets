/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function drawingTsCanvasPart9Test(): void {
  describe('DrawingTsCanvasPart9Test', () => {
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
    
    beforeAll(() => {
      
    })
    
    afterEach(() => {
      
    })
    
    afterAll(() => {
      
    })
    /**
     * @tc.name   testCanvasResetClipNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5600
     * @tc.desc   testCanvasResetClipNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetClipNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasResetClipNormal';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5700
     * @tc.desc   testCanvasResetClipMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipMultipleCalls';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip 1 success");
        canvas.resetClip();
        console.log(msg + " resetClip 2 success");
        canvas.resetClip();
        console.log(msg + " resetClip 3 success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterClipPath
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5800
     * @tc.desc   testCanvasResetClipAfterClipPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipAfterClipPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipAfterClipPath';
      let canvas = new drawing.Canvas(pixel);
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      path.lineTo(100, 10);
      path.close();
      try {
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipPath success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipAfterClipRoundRect
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5900
     * @tc.desc   testCanvasResetClipAfterClipRoundRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasResetClipAfterClipRoundRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasResetClipAfterClipRoundRect';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      let roundRect = new drawing.RoundRect(rect, 10, 10);
      try {
        canvas.clipRoundRect(roundRect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipRoundRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithoutClip
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6000
     * @tc.desc   testCanvasResetClipWithoutClip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithoutClip', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithoutClip';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.resetClip();
        console.log(msg + " resetClip success without clip");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithSaveRestore
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6100
     * @tc.desc   testCanvasResetClipWithSaveRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithSaveRestore', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithSaveRestore';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.save();
        console.log(msg + " save success");
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        canvas.restore();
        console.log(msg + " restore success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithDifferentClipOps
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6200
     * @tc.desc   testCanvasResetClipWithDifferentClipOps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasResetClipWithDifferentClipOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasResetClipWithDifferentClipOps';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.clipRect(rect, drawing.ClipOp.INTERSECT, true);
        console.log(msg + " clipRect INTERSECT success");
        canvas.resetClip();
        console.log(msg + " resetClip 1 success");
        
        canvas.clipRect(rect, drawing.ClipOp.DIFFERENCE, true);
        console.log(msg + " clipRect DIFFERENCE success");
        canvas.resetClip();
        console.log(msg + " resetClip 2 success");
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithDrawOperations
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6300
     * @tc.desc   testCanvasResetClipWithDrawOperations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipWithDrawOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasResetClipWithDrawOperations';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      let brush = new drawing.Brush();
      let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      try {
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.attachBrush(brush);
        canvas.drawRect({ left: 10, right: 200, top: 100, bottom: 300 });
        console.log(msg + " drawRect 1 success (with clip)");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        canvas.drawRect({ left: 10, right: 200, top: 100, bottom: 300 });
        console.log(msg + " drawRect 2 success (without clip)");
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetClipWithTransform
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_6400
     * @tc.desc   testCanvasResetClipWithTransform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipWithTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasResetClipWithTransform';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = { left: 10, top: 100, right: 200, bottom: 300 };
      try {
        canvas.translate(10, 10);
        console.log(msg + " translate success");
        canvas.scale(2, 2);
        console.log(msg + " scale success");
        canvas.rotate(30, 100, 100);
        console.log(msg + " rotate success");
        
        canvas.clipRect(rect);
        console.log(msg + " clipRect success");
        canvas.resetClip();
        console.log(msg + " resetClip success");
        
        let matrix = canvas.getTotalMatrix();
        console.log(msg + " getTotalMatrix success");
        expect(matrix !== null).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}
