'use static';

import colorFilterTest from "./ColorFilter.test";
import imageFilterTest from './ImageFilter.test'
import typefaceTest from "./Typeface.test";
import PathIterator from './PathIterator.test';
import DrawingTsLatticeTest from "./Lattice.test";
import maskFilterTest from './MaskFilter.test';
import roundRectTest from "./RoundRect.test";
import DrawingTsRoundRectPart2Test from "./RoundRectPart2.test";
import samplingOptionsTest  from "./SamplingOptions.test";
import shadowEffectTest from './ShaderEffect.test'
import shadowLayerTest from './ShadowLayer.test';
import toolTest from './Tool.test'
import typefaceArguments from './TypefaceArguments.test'
import rectUtils from './RectUtils.test'
import PointUtils from './PointUtils.test'

export default function testsuite() {
  samplingOptionsTest();
  colorFilterTest();
  imageFilterTest();
  typefaceTest();
  PathIterator();
  DrawingTsLatticeTest();
  maskFilterTest();
  roundRectTest();
  DrawingTsRoundRectPart2Test();
  shadowEffectTest();
  shadowLayerTest();
  toolTest();
  typefaceArguments();
  rectUtils();
  PointUtils();
}