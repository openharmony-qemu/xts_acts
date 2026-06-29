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
import samplingOptionsTest from './SamplingOptions.test';
import maskFilterTest from './MaskFilter.test';
import pathEffectTest from './PathEffect.test';
import shadowLayerTest from './ShadowLayer.test';
import DrawingTsShadowLayerPart2Test from './ShadowLayerPart2.test';
import colorFilterTest from './ColorFilter.test';
import DrawingTsColorFilterPart2Test from './ColorFilterPart2.test';
import penTest from './Pen.test';
import penPart2Test from './PenPart2.test'
import brushTest from './Brush.test';
import fontTest from './Font.test';
import fontPart2Test from './FontPart2.test'
import fontPart3Test from './FontPart3.test'
import latticeTest from './Lattice.test'
import DrawingTsLatticePart2Test from './LatticePart2.test'
import imageFilterTest from './ImageFilter.test'
import DrawingImageFilterPart2Test from './ImageFilterPart2.test'
import typefaceTest from './Typeface.test';
import DrawingTsTypefacePart2Test from './TypefacePart2.test';
import textBlobTest from './TextBlob.test';
import DrawingTsTextBlob2Test from './TextBlob2.test';
import DrawingTsTextBlobPart3Test from './TextBlobPart3.test';
import drawingTsPathTest from './Path.test';
import drawingTsPath2Test from './Path2.test';
import drawingTsPath3Test from './Path3.test';
import drawingTsPath5Test from './Path5.test';
import drawingTsPath6Test from './Path6.test';
import drawingTsPath7Test from './Path7.test';
import drawingTsPath8Test from './Path8.test';
import drawingTsPath9Test from './Path9.test';
import drawingTsCanvasTest from './Canvas.test';
import drawingTsCanvasPart2Test from './CanvasPart2.test';
import drawingTsCanvasPart3Test from './CanvasPart3.test';
import drawingTsCanvasPart4Test from './CanvasPart4.test';
import drawingTsCanvasPart5Test from './CanvasPart5.test';
import drawingTsCanvasPart6Test from './CanvasPart6.test';
import drawingTsCanvasPart7Test from './CanvasPart7.test';
import drawingTsCanvasPart8Test from './CanvasPart8.test';
import drawingTsCanvasPart9Test from './CanvasPart9.test';
import drawingTsCanvasPart10Test from './CanvasPart10.test';
import drawingTsRegionTest from './Region.test';
import drawingTsRegionPart2Test from "./Region2.test";
import drawingTsRegionPart3Test from "./Region3.test";
import drawingTsMatrixTest from './Matrix.test';
import drawingTsMatrixPart2Test from './MatrixPart2.test';
import drawingTsMatrixPart3Test from './MatrixPart3.test';
import roundRectTest from './RoundRect.test';
import DrawingTsRoundRectPart2Test from './RoundRectPart2.test';
import shadowEffectTest from './ShaderEffect.test'
import DrawingTsShaderEffectPart2Test from './ShaderEffectPart2.test'
import toolTest from './Tool.test'
import DrawingTsToolPart2Test from './ToolPart2.test'
import typefaceArguments from './TypefaceArguments.test'
import DrawingTsTypefaceArgumentsPart2Test from './TypefaceArgumentsPart2.test'
import rectUtils from './RectUtils.test'
import DrawingTsRectUtilsPart2Test from './RectUtilsPart2.test'
import DrawingTsBrushPart2 from './BrushPart2.test';
import FontPart4 from './FontPart4.test';
import DrawingTsFontPart5Test from './FontPart5.test';
import PathEffect2 from './PathEffect2.test';
import DrawingPathEffectPart3Test from './PathEffect3.test';
import PathIterator from './PathIterator.test';
import DrawingPathIteratorPart2Test from './PathIteratorPart2.test';
import PenPart3 from './PenPart3.test';
import PointUtils from './PointUtils.test';

export default function testsuite() {
  samplingOptionsTest();
  maskFilterTest();
  pathEffectTest();
  shadowLayerTest();
  DrawingTsShadowLayerPart2Test();
  colorFilterTest();
  DrawingTsColorFilterPart2Test();
  penTest();
  penPart2Test();
  brushTest();
  fontTest();
  fontPart2Test();
  fontPart3Test();
  imageFilterTest();
  DrawingImageFilterPart2Test();
  latticeTest();
  DrawingTsLatticePart2Test();
  drawingTsMatrixTest();
  drawingTsMatrixPart2Test();
  drawingTsMatrixPart3Test();
  typefaceTest();
  DrawingTsTypefacePart2Test();
  textBlobTest();
  DrawingTsTextBlob2Test();
  DrawingTsTextBlobPart3Test();
  drawingTsPathTest();
  drawingTsPath2Test();
  drawingTsPath3Test();
  drawingTsPath5Test();
  drawingTsPath6Test();
  drawingTsPath7Test();
  drawingTsPath8Test();
  drawingTsPath9Test();
  drawingTsCanvasTest();
  drawingTsCanvasPart2Test();
  drawingTsCanvasPart3Test();
  drawingTsCanvasPart4Test();
  drawingTsCanvasPart5Test();
  drawingTsCanvasPart6Test();
  drawingTsCanvasPart7Test();
  drawingTsCanvasPart8Test();
  drawingTsCanvasPart9Test();
  drawingTsCanvasPart10Test();
  drawingTsRegionTest();
  drawingTsRegionPart2Test();
  drawingTsRegionPart3Test();
  roundRectTest();
  DrawingTsRoundRectPart2Test();
  shadowEffectTest();
  DrawingTsShaderEffectPart2Test();
  toolTest();
  DrawingTsToolPart2Test();
  typefaceArguments();
  DrawingTsTypefaceArgumentsPart2Test();
  rectUtils();
  DrawingTsRectUtilsPart2Test();
  DrawingTsBrushPart2();
  FontPart4();
  DrawingTsFontPart5Test();
  PathEffect2();
  DrawingPathEffectPart3Test();
  PathIterator();
  DrawingPathIteratorPart2Test();
  PenPart3();
  PointUtils();
}