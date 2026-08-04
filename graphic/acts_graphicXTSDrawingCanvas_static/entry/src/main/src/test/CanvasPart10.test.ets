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

export default function DrawingTsCanvasPart10Test(): void {
  describe('DrawingTsCanvasPart10Test', () => {
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
     * @tc.name   testCanvasDrawColor18NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0100
     * @tc.desc   testCanvasDrawColor18Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColor18NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawColor18NormalStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.drawColor(0xFFFF0000.toInt());
        console.info(msg + ' drawColor with number succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(0x00FFFFFF.toInt(), drawing.BlendMode.SRC_OVER);
        console.info(msg + ' drawColor with blendMode succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(0x00000000.toInt());
        console.info(msg + ' drawColor with min value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(0xFFFFFFFF.toInt());
        console.info(msg + ' drawColor with max value succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawColor18BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0200
     * @tc.desc   testCanvasDrawColor18BoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColor18BoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColor18BoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.drawColor(-1);
        console.info(msg + ' drawColor(-1) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` -1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(0x100000000.toInt());
        console.info(msg + ' drawColor(0x100000000) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 0x100000000 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawColor((Number.MAX_SAFE_INTEGER).toInt());
        console.info(msg + ' drawColor(Number.MAX_SAFE_INTEGER) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` MAX_SAFE_INTEGER errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawColor((Number.MIN_SAFE_INTEGER).toInt());
        console.info(msg + ' drawColor(Number.MIN_SAFE_INTEGER) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` MIN_SAFE_INTEGER errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawColor18NullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0300
     * @tc.desc   testCanvasDrawColor18Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColor18NullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColor18NullStatic';
      let canvas = new drawing.Canvas(pixel!);
      try {
        canvas.drawColor(0x00FFFFFF.toInt(), undefined);
        console.info(msg + ' undefined drawColor with blendMode succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` undefined errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawColor18MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0400
     * @tc.desc   testCanvasDrawColor18MultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColor18MultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColor18MultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel!);

      for (let i = 0; i < 20; i++) {
        try {
          const randomColor = Math.floor(Math.random() * 0xFFFFFFFF).toInt();
          canvas.drawColor(randomColor);
          console.info(msg + ' drawColor succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasDrawColor18AllBlendModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0500
     * @tc.desc   testCanvasDrawColor18AllBlendModes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColor18AllBlendModesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawColor18AllBlendModesStatic';
      let canvas = new drawing.Canvas(pixel!);
      const blendModes = [
        drawing.BlendMode.CLEAR,
        drawing.BlendMode.SRC,
        drawing.BlendMode.DST,
        drawing.BlendMode.SRC_OVER,
        drawing.BlendMode.DST_OVER,
        drawing.BlendMode.SRC_IN,
        drawing.BlendMode.DST_IN,
        drawing.BlendMode.SRC_OUT,
        drawing.BlendMode.DST_OUT,
        drawing.BlendMode.SRC_ATOP,
        drawing.BlendMode.DST_ATOP,
        drawing.BlendMode.XOR,
        drawing.BlendMode.PLUS,
        drawing.BlendMode.MODULATE,
        drawing.BlendMode.SCREEN,
        drawing.BlendMode.OVERLAY,
        drawing.BlendMode.DARKEN,
        drawing.BlendMode.LIGHTEN,
        drawing.BlendMode.COLOR_DODGE,
        drawing.BlendMode.COLOR_BURN,
        drawing.BlendMode.HARD_LIGHT,
        drawing.BlendMode.SOFT_LIGHT,
        drawing.BlendMode.DIFFERENCE,
        drawing.BlendMode.EXCLUSION,
        drawing.BlendMode.MULTIPLY,
        drawing.BlendMode.HUE,
        drawing.BlendMode.SATURATION,
        drawing.BlendMode.COLOR,
        drawing.BlendMode.LUMINOSITY
      ];

      for (let mode of blendModes) {
        try {
          canvas.drawColor(0xFF00FF00.toInt(), mode);
          console.info(msg + ` drawColor with blendMode(${mode}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasClear18NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0600
     * @tc.desc   testCanvasClear18Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClear18NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClear18NormalStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.clear(0xFFFF0000.toInt());
        console.info(msg + ' clear with number succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let color: common2D.Color = {alpha: 255, red: 0, green: 255, blue: 0};
        canvas.clear(color);
        console.info(msg + ' clear with Color succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasClear18BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0700
     * @tc.desc   testCanvasClear18BoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClear18BoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClear18BoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.clear(0);
        console.info(msg + ' clear(0) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.clear(0xFFFFFFFF.toInt());
        console.info(msg + ' clear(max) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawShadow18ColorNumberStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0800
     * @tc.desc   testCanvasDrawShadow18ColorNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadow18ColorNumberStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawShadow18ColorNumberStatic';
      let canvas = new drawing.Canvas(pixel!);
      const path = new drawing.Path();
      path.addCircle(50, 50, 30, drawing.PathDirection.CLOCKWISE);

      try {
        let point1: common2D.Point3d = {x: 100, y: 80, z: 80};
        let point2: common2D.Point3d = {x: 200, y: 10, z: 40};
        let shadowFlag: drawing.ShadowFlag = drawing.ShadowFlag.ALL;
        canvas.drawShadow(path, point1, point2, 30, 0xFF0000FF.toInt(), 0xFFFF0000.toInt(), shadowFlag);
        console.info(msg + ' drawShadow with number color succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawVerticesNormalAIStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_0900
     * @tc.desc   testCanvasDrawVerticesNormalAI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawVerticesNormalAIStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawVerticesNormalAIStatic';
      let canvas = new drawing.Canvas(pixel!);

      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 10.0, y: 10.0 };
      const point2: common2D.Point = { x: 50.0, y: 10.0 };
      const point3: common2D.Point = { x: 30.0, y: 50.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);

      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);

      const colors = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices = [0, 1, 2];

      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, pointsArray, texsArray, colors, 3, indices, drawing.BlendMode.SRC);
        console.info(msg + ' drawVertices succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawVerticesNullArraysStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_1000
     * @tc.desc   testCanvasDrawVerticesNullArrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesNullArraysStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawVerticesNullArraysStatic';
      let canvas = new drawing.Canvas(pixel!);

      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 10.0, y: 10.0 };
      const point2: common2D.Point = { x: 50.0, y: 10.0 };
      const point3: common2D.Point = { x: 30.0, y: 50.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);

      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, pointsArray, null, null, 0, null, drawing.BlendMode.SRC);
        console.info(msg + ' drawVertices with null arrays succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawVerticesAllModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_1100
     * @tc.desc   testCanvasDrawVerticesAllModes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawVerticesAllModesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawVerticesAllModesStatic';
      let canvas = new drawing.Canvas(pixel!);

      let pointsArray = new Array<common2D.Point>();
      pointsArray.push({ x: 10.0, y: 10.0 });
      pointsArray.push({ x: 50.0, y: 10.0 });
      pointsArray.push({ x: 30.0, y: 50.0 });

      const colors = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices = [0, 1, 2];

      const modes = [
        drawing.VertexMode.TRIANGLES_VERTEXMODE,
        drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE,
        drawing.VertexMode.TRIANGLESFAN_VERTEXMODE
      ];

      for (let mode of modes) {
        try {
          canvas.drawVertices(mode, 3, pointsArray, null, colors, 3, indices, drawing.BlendMode.SRC);
          console.info(msg + ` drawVertices with mode(${mode}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasDrawSingleCharacterWithFeaturesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_1200
     * @tc.desc   testCanvasDrawSingleCharacterWithFeatures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawSingleCharacterWithFeaturesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawSingleCharacterWithFeaturesStatic';
      let canvas = new drawing.Canvas(pixel!);
      const brush = new drawing.Brush();
      brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      const font = new drawing.Font();
      font.setSize(20);

      try {
        let fontFeatures: Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: 0});
        canvas.attachBrush(brush);
        canvas.drawSingleCharacterWithFeatures("A", font, 10, 10, fontFeatures);
        console.info(msg + ' drawSingleCharacterWithFeatures succeeded');
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasGetTotalMatrixAfterSetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_1900
     * @tc.desc   testCanvasGetTotalMatrixAfterSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetTotalMatrixAfterSetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasGetTotalMatrixAfterSetStatic';
      let canvas = new drawing.Canvas(pixel!);
      let matrix = new drawing.Matrix();
      matrix.setMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1]);

      try {
        canvas.setMatrix(matrix);
        let resultMatrix = canvas.getTotalMatrix();
        expect(resultMatrix != null).assertTrue();
        console.info(msg + ' getTotalMatrix after setMatrix succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRoundRectNormalAIStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_2000
     * @tc.desc   testCanvasDrawRoundRectNormalAI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRoundRectNormalAIStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawRoundRectNormalAIStatic';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10, top: 10, right: 50, bottom: 50 };
      let roundRect = new drawing.RoundRect(rect, 5, 5);

      try {
        canvas.drawRoundRect(roundRect);
        console.info(msg + ' drawRoundRect succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawArcBoundaryAngleStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_2500
     * @tc.desc   testCanvasDrawArcBoundaryAngle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcBoundaryAngleStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcBoundaryAngleStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(2);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);
      const rect: common2D.Rect = {left: 20, top: 20, right: 80, bottom: 60};

      try {
        canvas.drawArc(rect, 0, 360);
        console.info(msg + ' drawArc with 360 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawArc(rect, 0, -360);
        console.info(msg + ' drawArc with -360 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawArc(rect, 0, 400);
        console.info(msg + ' drawArc with 400 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      canvas.detachPen();
    })
    /**
     * @tc.name   testCanvasDrawPointsAllModesStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_2700
     * @tc.desc   testCanvasDrawPointsAllModes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointsAllModesStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPointsAllModesStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(5);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);
      let points:Array<common2D.Point> = [{x: 10, y: 20}, {x: 30, y: 40}, {x: 50, y: 60}];

      const modes = [
        drawing.PointMode.POINTS,
        drawing.PointMode.LINES,
        drawing.PointMode.POLYGON
      ];

      for (let mode of modes) {
        try {
          canvas.drawPoints(points, mode);
          console.info(msg + ` drawPoints with mode(${mode}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
      canvas.detachPen();
    })
    /**
     * @tc.name   testCanvasDrawGlyphsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_2900
     * @tc.desc   testCanvasDrawGlyphsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawGlyphsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawGlyphsNormalStatic';
      let canvas = new drawing.Canvas(pixel!);
      const brush = new drawing.Brush();
      brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      const font = new drawing.Font();
      font.setSize(20);
      canvas.attachBrush(brush);

      let glyphsArray: Array<int> = [100, 200, 300];
      let positionArray = new Array<common2D.Point>();
      positionArray.push({ x: 10, y: 20 });
      positionArray.push({ x: 30, y: 20 });
      positionArray.push({ x: 50, y: 20 });

      try {
        canvas.drawGlyphs(glyphsArray, 0, positionArray, 0, 3, font);
        console.info(msg + ' drawGlyphs succeeded');
        canvas.detachBrush();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawCircleBoundaryRadiusStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3100
     * @tc.desc   testCanvasDrawCircleBoundaryRadius
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleBoundaryRadiusStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawCircleBoundaryRadiusStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(2);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);

      try {
        canvas.drawCircle(50, 50, 0);
        console.info(msg + ' drawCircle with radius 0 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawCircle(50, 50, -1);
        console.info(msg + ' drawCircle with radius -1 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawCircle(50, 50, 50);
        console.info(msg + ' drawCircle with max radius succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      canvas.detachPen();
    })

    /**
     * @tc.name   testCanvasDrawpixelMapMeshBoundaryStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3200
     * @tc.desc   testCanvasDrawpixelMapMeshBoundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshBoundaryStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      const msg = 'testCanvasDrawPixelMapMeshBoundaryStatic';
      const width = 100;
      const height = 100;
      const bufferSize = width * height * 4;
      const color: ArrayBuffer = new ArrayBuffer(bufferSize);
      const colorData = new Uint8Array(color);
      for (let i = 0; i < colorData.length; i += 4) {
        colorData[i] = 255;
        colorData[i+1] = 156;
        colorData[i+2] = 0;
        colorData[i+3] = 255;
      }

      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height, width }
      }

      let pixelMap: image.PixelMap = await image.createPixelMap(color, opts);
      let canvas = new drawing.Canvas(pixel!);
      const brush = new drawing.Brush();
      canvas.attachBrush(brush);

      let verts: Array<number> = [0, 0, 50, 0, 100, 0, 0, 50, 50, 50, 100, 50, 0, 100, 50, 100, 100, 100];

      try {
        canvas.drawPixelMapMesh(pixelMap, 0, 2, verts, 0, null, 0);
        console.info(msg + ' drawPixelMapMesh with meshWidth 0 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPixelMapMesh(pixelMap, 2, 0, verts, 0, null, 0);
        console.info(msg + ' drawPixelMapMesh with meshHeight 0 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      canvas.detachBrush();
    })

    /**
     * @tc.name   testCanvasClipPathAllOpsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3300
     * @tc.desc   testCanvasClipPathAllOps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipPathAllOpsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClipPathAllOpsStatic';
      let canvas = new drawing.Canvas(pixel!);
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(50, 10);
      path.lineTo(50, 50);
      path.close();

      const ops = [
        drawing.ClipOp.DIFFERENCE,
        drawing.ClipOp.INTERSECT
      ];

      for (let op of ops) {
        try {
          canvas.clipPath(path, op, true);
          console.info(msg + ` clipPath with op(${op}) succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testCanvasSaveAndRestoreStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3400
     * @tc.desc   testCanvasSaveAndRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveAndRestoreStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSaveAndRestoreStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        let count1 = canvas.save();
        expect(count1).assertEqual(1);
        console.info(msg + ' save succeeded');

        let rect: common2D.Rect = { left: 10, top: 10, right: 50, bottom: 50 };
        canvas.clipRect(rect);

        let count2 = canvas.save();
        expect(count2).assertEqual(2);
        console.info(msg + ' second save succeeded');

        canvas.restore();
        console.info(msg + ' restore succeeded');

        canvas.restore();
        console.info(msg + ' second restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasSaveLayerAllNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3500
     * @tc.desc   testCanvasSaveLayerAllNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveLayerAllNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSaveLayerAllNullStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        let count = canvas.saveLayer(null, null);
        expect(count).assertEqual(1);
        console.info(msg + ' saveLayer succeeded');

        canvas.restore();
        console.info(msg + ' restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasSaveLayerWithRectAndBrushStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3600
     * @tc.desc   testCanvasSaveLayerWithRectAndBrush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveLayerWithRectAndBrushStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSaveLayerWithRectAndBrushStatic';
      let canvas = new drawing.Canvas(pixel!);
      let rect: common2D.Rect = { left: 10, top: 10, right: 50, bottom: 50 };
      let brush = new drawing.Brush();
      brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});

      try {
        let count = canvas.saveLayer(rect, brush);
        expect(count).assertEqual(1);
        console.info(msg + ' saveLayer with rect and brush succeeded');

        canvas.restore();
        console.info(msg + ' restore succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRect12NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3700
     * @tc.desc   testCanvasDrawRect12Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRect12NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawRect12NormalStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(2);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);

      try {
        canvas.drawRect(0, 0, 50, 50);
        console.info(msg + ' drawRect with 4 parameters succeeded');
        canvas.detachPen();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRectBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3800
     * @tc.desc   testCanvasDrawRectBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRectBoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(2);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);

      try {
        canvas.drawRect(0, 0, 100, 100);
        console.info(msg + ' drawRect with max boundary succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawRect(-1, -1, 50, 50);
        console.info(msg + ' drawRect with negative boundary succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawRect(50, 50, 0, 0);
        console.info(msg + ' drawRect with reversed coordinates succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      canvas.detachPen();
    })

    /**
     * @tc.name   testCanvasDrawColor12NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_3900
     * @tc.desc   testCanvasDrawColor12Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColor12NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawColor12NormalStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.drawColor(255, 255, 0, 0);
        console.info(msg + ' drawColor with 4 parameters succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(255, 255, 0, 0, drawing.BlendMode.SRC_OVER);
        console.info(msg + ' drawColor with 4 parameters and blendMode succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawColor12BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_4000
     * @tc.desc   testCanvasDrawColor12BoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColor12BoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColor12BoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);

      try {
        canvas.drawColor(0, 0, 0, 0);
        console.info(msg + ' drawColor with min values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(255, 255, 255, 255);
        console.info(msg + ' drawColor with max values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawColor(-1, 255, 255, 255);
        console.info(msg + ' drawColor with -1 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawColor(256, 255, 255, 255);
        console.info(msg + ' drawColor with 256 succeeded');
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawLineBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_AI_CANVAS_STATIC_4100
     * @tc.desc   testCanvasDrawLineBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawLineBoundaryValueStatic';
      let canvas = new drawing.Canvas(pixel!);
      const pen = new drawing.Pen();
      pen.setStrokeWidth(2);
      pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
      canvas.attachPen(pen);

      try {
        canvas.drawLine(0, 0, 100, 100);
        console.info(msg + ' drawLine with max boundary succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawLine(-1, -1, 50, 50);
        console.info(msg + ' drawLine with negative values succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        canvas.drawLine(50, 50, 50, 50);
        console.info(msg + ' drawLine with same start and end succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      canvas.detachPen();
    })
  })
}