
import colorFilterTest from "./ColorFilter.test";
import brushTest from "./Brush.test";
import BrushPart2 from "./BrushPart2.test";
import fontTest from "./Font.test";
import fontPart2Test from './FontPart2.test'
import fontPart3Test from './FontPart3.test'
import FontPart4 from './FontPart4.test';
import imageFilterTest from './ImageFilter.test'
import typefaceTest from "./Typeface.test";
import drawingTsPathTest from "./Path.test";
import drawingTsPath2Test from "./Path2.test";
import drawingTsPath3Test from "./Path3.test";
import drawingTsPath4Test from "./Path4.test";
import drawingTsPath6Test from "./Path6.test";
import pathEffectTest from './PathEffect.test';
import PathEffect2 from './PathEffect2.test';
import PathIterator from './PathIterator.test';


import penTest from "./Pen.test";
import penPart2Test from "./PenPart2.test";
import PenPart3 from './PenPart3.test';
import DrawingTsRegionTest from "./Region.test";
import drawingTsRegionPart2Test from "./Region2.test";
import DrawingTsLatticeTest from "./Lattice.test";
import maskFilterTest from './MaskFilter.test';
import drawingTsCanvasTest from "./Canvas.test";
import drawingTsCanvasPart2Test from "./CanvasPart2.test";
import drawingTsCanvasPart3Test from "./CanvasPart3.test";
import drawingTsCanvasPart4Test from "./CanvasPart4.test";
import drawingTsCanvasPart5Test from "./CanvasPart5.test";
import drawingTsCanvasPart6Test from "./CanvasPart6.test";
import drawingTsCanvasPart7Test from "./CanvasPart7.test";
import drawingTsCanvasPart8Test from "./CanvasPart8.test";
import drawingTsMatrixTest from "./Matrix.test";
import drawingTsMatrixPart2Test from "./MatrixPart2.test";
import roundRectTest from "./RoundRect.test";
import samplingOptionsTest  from "./SamplingOptions.test";
import shadowEffectTest from './ShaderEffect.test'
import shadowLayerTest from './ShadowLayer.test';
import textBlobTest from './TextBlob.test';
import textBlob2Test from './TextBlob2.test';
import toolTest from './Tool.test'
import typefaceArguments from './TypefaceArguments.test'
import rectUtils from './RectUtils.test'

export default function testsuite() {
  samplingOptionsTest();
  colorFilterTest();
  brushTest();
  BrushPart2();
  fontTest();
  fontPart2Test();
  fontPart3Test();
  FontPart4();
  imageFilterTest();
  typefaceTest();
  drawingTsPathTest();
  drawingTsPath2Test();
  drawingTsPath3Test();
  drawingTsPath4Test();
  drawingTsPath6Test();
  pathEffectTest();
  PathEffect2();
  PathIterator();
  penTest();
  penPart2Test();
  PenPart3();
  DrawingTsRegionTest();
  drawingTsRegionPart2Test();
  DrawingTsLatticeTest();
  maskFilterTest();
  drawingTsCanvasTest();
  drawingTsCanvasPart2Test();
  drawingTsCanvasPart3Test();
  drawingTsCanvasPart4Test();
  drawingTsCanvasPart5Test();
  drawingTsCanvasPart6Test();
  drawingTsCanvasPart7Test();
  drawingTsCanvasPart8Test();
  drawingTsMatrixTest();
  drawingTsMatrixPart2Test();
  roundRectTest();
  shadowEffectTest();
  shadowLayerTest();
  textBlobTest();
  textBlob2Test();
  toolTest();
  typefaceArguments();
  rectUtils();
}