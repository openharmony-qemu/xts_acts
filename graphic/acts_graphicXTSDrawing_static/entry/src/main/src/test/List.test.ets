'use static';

import colorFilterTest from "./ColorFilter.test";
import DrawingTsColorFilterPart2Test from "./ColorFilterPart2.test";
import imageFilterTest from './ImageFilter.test'
import DrawingImageFilterPart2Test from './ImageFilterPart2.test'
import typefaceTest from "./Typeface.test";
import DrawingTsTypefacePart2Test from './TypefacePart2.test';
import PathIterator from './PathIterator.test';
import DrawingPathIteratorPart2Test from './PathIteratorPart2.test';
import DrawingTsLatticeTest from "./Lattice.test";
import DrawingTsLatticePart2Test from "./LatticePart2.test";
import maskFilterTest from './MaskFilter.test';
import roundRectTest from "./RoundRect.test";
import DrawingTsRoundRectPart2Test from "./RoundRectPart2.test";
import samplingOptionsTest  from "./SamplingOptions.test";
import shadowEffectTest from './ShaderEffect.test'
import DrawingTsShaderEffectPart2Test from './ShaderEffectPart2.test'
import shadowLayerTest from './ShadowLayer.test';
import DrawingTsShadowLayerPart2Test from './ShadowLayerPart2.test';
import toolTest from './Tool.test'
import DrawingTsToolPart2Test from './ToolPart2.test';
import typefaceArguments from './TypefaceArguments.test'
import DrawingTsTypefaceArgumentsPart2Test from './TypefaceArgumentsPart2.test';
import rectUtils from './RectUtils.test'
import DrawingTsRectUtilsPart2Test from './RectUtilsPart2.test'
import PointUtils from './PointUtils.test'

export default function testsuite() {
  samplingOptionsTest();
  colorFilterTest();
  DrawingTsColorFilterPart2Test();
  imageFilterTest();
  DrawingImageFilterPart2Test();
  typefaceTest();
  DrawingTsTypefacePart2Test();
  PathIterator();
  DrawingPathIteratorPart2Test();
  DrawingTsLatticeTest();
  DrawingTsLatticePart2Test();
  maskFilterTest();
  roundRectTest();
  DrawingTsRoundRectPart2Test();
  shadowEffectTest();
  DrawingTsShaderEffectPart2Test();
  shadowLayerTest();
  DrawingTsShadowLayerPart2Test();
  toolTest();
  DrawingTsToolPart2Test();
  typefaceArguments();
  DrawingTsTypefaceArgumentsPart2Test();
  rectUtils();
  DrawingTsRectUtilsPart2Test();
  PointUtils();
}