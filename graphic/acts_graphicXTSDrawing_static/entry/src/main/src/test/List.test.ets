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
import samplingOptionsTest  from "./SamplingOptions.test";
import colorFilterTest from "./ColorFilter.test";
import penTest from "./Pen.test";
import penPart2Test from "./PenPart2.test";
import brushTest from "./Brush.test";
import fontTest from "./Font.test";
import typefaceTest from "./Typeface.test";
import drawingTsPathTest from "./Path.test";
import drawingTsPath3Test from "./Path3.test";
import drawingTsPath4Test from "./Path4.test";
import DrawingTsRegionTest from "./Region.test";
import DrawingTsLatticeTest from "./Lattice.test";
import drawingTsCanvasTest from "./Canvas.test";
import drawingTsCanvasPart2Test from "./CanvasPart2.test";
import drawingTsCanvasPart3Test from "./CanvasPart3.test";
import drawingTsCanvasPart4Test from "./CanvasPart4.test";
import drawingTsCanvasPart5Test from "./CanvasPart5.test";
import drawingTsMatrixTest from "./Matrix.test";
import drawingTsMatrixPart2Test from "./MatrixPart2.test";
import roundRectTest from "./RoundRect.test";

export default function testsuite() {
  samplingOptionsTest();
  colorFilterTest();
  penTest();
  penPart2Test();
  brushTest();
  fontTest();
  typefaceTest();
  drawingTsPathTest();
  drawingTsPath3Test();
  drawingTsPath4Test();
  DrawingTsRegionTest();
  DrawingTsLatticeTest();
  drawingTsCanvasTest();
  drawingTsCanvasPart2Test();
  drawingTsCanvasPart3Test();
  drawingTsCanvasPart4Test();
  drawingTsCanvasPart5Test();
  drawingTsMatrixTest();
  drawingTsMatrixPart2Test();
  roundRectTest();
}