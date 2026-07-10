'use static';
import StyledStringTest from './StyledStringTest/StyledString.test';
import CustomSpanMeasureInfoTest from './StyledStringTest/CustomSpanMeasureInfo.test';
import StyledStringFontVariationsTest from './StyledStringTest/StyledStringFontVariations.test';
import LineHeightStyleTest from './StyledStringTest/LineHeightStyle.test';
import LineSpacingStyleTest from './StyledStringTest/LineSpacingStyle.test';
import StyledStringShaderStyleTest from './StyledString26Test/StyledStringShaderStyle.test';
import StyledStringStrokeJoinStyleTest from './StyledString26Test/StyledStringStrokeJoinStyle.test';
import ParagraphStyleTailIndentsTest from './StyledString26Test/ParagraphStyleTailIndents.test';
import ThicknessScaleTest from './StyledString26Test/ThicknessScale.test';
import EnableMultiTypeTest from './StyledString26Test/EnableMultiType.test';

export default function testsuite() {
  StyledStringTest();
  CustomSpanMeasureInfoTest();
  StyledStringFontVariationsTest();
  LineHeightStyleTest();
  LineSpacingStyleTest();
  StyledStringShaderStyleTest();
  StyledStringStrokeJoinStyleTest();
  ParagraphStyleTailIndentsTest();
  ThicknessScaleTest();
  EnableMultiTypeTest();
}