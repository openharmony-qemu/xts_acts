'use static';
/**
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
import textAreaInputTest from './TextAreaTest/TextAreaInputTest01.test';
import marqueeJsunit from './marqueeTest/MarqueeJsunit.test';
import textStyleJsunit from './textTest/TextStyleJsunit.test';
import ImageTextTest from './textTest/ImageText.test';
import TextAreaCallbackTest from './TextAreaTest/TextAreaCallback.test';
import TextAreaSelectTest from './TextAreaTest/TextAreaSelect.test';
import Image_QRCode_Api from './textTest/ImageQRCodeApi.test';
import RichEditorApi from './RichEditorTest/RichEditorApi.test';
import APIgetUIFontConfigJsunit from './fontTest/APIgetUIFontConfigJsunit.test';
import APITextBackgroundStyleJsunit from './ContainerSpanTest/APITextBackgroundStyleJsunit.test'
import SXrenderingStrategyJsunit from './RichEditorTest/SXrenderingStrategyJsunit.test';
import SXsymbolSpanStyleJsunit from './RichEditorTest/SXsymbolSpanStyleJsunit.test';
import SXsymbolStyleJsunit from './RichEditorTest/SXsymbolStyleJsunit.test';
import SXvalueResourceJsunit from './RichEditorTest/SXvalueResourceJsunit.test'
import SXSymbolGlyphSINGLE01Jsunit from './SymbolGlyphTest/SXSymbolGlyphSINGLE01Jsunit.test'
import textDataDataDetectorConfig from './textTest/textDataDataDetectorConfig.test'
import richEditorApi2 from './RichEditorTest/richEditorApi/richEditorApi2.test'
import richEditorApi3 from './RichEditorTest/richEditorApi/richEditorApi3.test'
import RichEditorTest from './RichEditorTest/RichEditor/RichEditor.test';
import spanApi1 from './spanTest/spanApi/spanApi1.test';
import symbolGlyphApi1 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi1.test'
import symbolGlyphApi2 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi2.test'
import symbolGlyphApi3 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi3.test'
import symbolGlyphApi4 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi4.test'
import symbolGlyphApi5 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi5.test'
import symbolSpanApi2Test from './symbolSpanTest/symbolSpanApi/symbolSpanApi2.test'
import symbolSpanApi1 from './symbolSpanTest/symbolSpanApi/symbolSpanApi1.test'
import TextStyle from './textTest/TextApi/TextStyle.test';
import tabsDemo from './textTest/TextApi/tabsDemo.test';
import TextSelectionMenu from './textTest/TextApi/TextSelectionMenu.test';
import textInputApi1 from './TextInputTest/textInputApi/textInputApi1.test'
import textInputApiTest from './TextInputTest/textInputApi/textinputkeyNewLine.test'
import UIfont from './fontTest/UIfont/UIfont.test';
import TextfieldMultiTest from './textTest/TextfieldMulti.test';
import TextfieldOtherTest from './textTest/TextfieldOther.test';
import TextfieldSingleTest from './textTest/TextfieldSingle.test';
import richEditorApi4 from './RichEditorTest/richEditorApi/richEditorApi4.test';
import richEditorApi5 from './RichEditorTest/richEditorApi/richEditorApi5.test';
import richEditorApi6 from './RichEditorTest/richEditorApi/richEditorApi6.test';
import richEditorApi7 from './RichEditorTest/richEditorApi/richEditorApi7.test';
import richEditorApi8 from './RichEditorTest/richEditorApi/richEditorApi8.test';
import search from './SearchTest/SearchTest.test';
import CurveTest from './textTest/CurveJsunit.test';
import backgroundAndSizeSettingJsunit from './textTest/BackgroundAndSizeSettingJsunit.test';
import borderJsunit from './textTest/BorderJsunit.test';
import textAreaJsunit from './TextAreaTest/TextAreaJsunit.test';
import textAreaUxTest  from './TextAreaTest/textareaux.test';
import textInputJsunit from './TextInputTest/TextInputJsunit.test';
import propJsunit from './textTest/PropJsunit.test';
import spanJsunit from './spanTest/SpanJsunit.test';
import textJsunit from './textTest/TextJsunit.test';
import outline from './textTest/Outline1.test';
import stageFontTest from './textTest/StageFont1.test';
import stageMediaquery from './textTest/StageMediaquery01.test';
import textInputTest from './TextInputTest/TextInput01'
import search_caret from './SearchTest/SearchCaret.test';
import search_maxLength from './SearchTest/SearchMaxLength.test';
import search_maxLength2 from './SearchTest/SearchMaxLength2.test';
import search_top from './SearchTest/SearchTop.test'
import search_bottom from './SearchTest/SearchBottom.test'
import textArea_top from './TextAreaTest/TextAreaTop.test'
import textArea_bottom from './TextAreaTest/TextAreaBottom.test'
import textAenEnabledJsunit from './TextAreaTest/textAenEnabledJsunit.test';
import textInput_caret from './TextInputTest/TextInputCaret.test';
import textOneJsunit from './textTest/textOneJsunit.test';
import textTwoJsunit from './textTest/textTwoJsunit.test';
import textEnabledJsunit from './textTest/textEnabledJsunit.test';
import textChangeEnabledJsunit from './textTest/textChangeEnabledJsunit.test';
import marqueeUIJsunit from './marqueeTest/marqueeUIJsunit.test';
import spanUIJsunit from './spanTest/SpanUIJsunit01.test';
import fontJsunit from './fontTest/fontJsunit.test';
import textClockJsunit from './textTest/TextClockJsunit.test';
import textTimerJsunit from './textTest/TextTimerJsunit.test';
import unitsModuleNameJsunit from './textTest/units.test';
import appVersionCodeJsunit from './textTest/App01.test';
import colorEnumJsunit from './textTest/Color01.test';
import copyOptionJsunit from './textTest/CopyOption01.test';
import TextStyle2 from './textTest/TextApi/TextStyle2.test';
import textMinFontSizeJsunit from './textTest/Text1.test';
import textAreaOnCutJsunit from './TextAreaTest/TextArea01.test';
import textInputOnEditChangeJsunit from './TextInputTest/textInput.test';
import text3Jsunit from './textTest/Text3Jsunit.test';
import span3Jsunit from './spanTest/Span3Jsunit.test';
import ActsRichEditorTest from './RichEditorTest/RichEditor/Richeditor01.test';
import textAreaJsunit3 from './TextAreaTest/TextAreaJsunit3.test';
import textInputJsunit3 from './TextInputTest/TextInputJsunit3.test';
import textObscuredTest from './textTest/textObscuredTest.test';
import textSpanFontTest from './textTest/textSpanFont.test';
import textAreaOnCaretAndKeyboardTest from './TextAreaTest/textAreaOnCaretAndKeyboard.test';
import richEditorTest from './RichEditorTest/RichEditorJsunit.test';
import textTextCaseTest from './textTest/textTextCase.test';
import textTextDecorationTest from './textTest/textTextDecoration.test';
import searchTest from './SearchTest/SearchJsunit1.test';
import TextAreaTypeTest from "./TextAreaTest/TextAreaType.test";
import SearchTypeTest from "./SearchTest/SearchType.test";
import ImageSpanVisibilityTest from "./ImageSpanTest/ImageSpanVisibility.test";
import showCounterTest from './TextInputTest/ShowCounter.test';
import UIFontAliasInfo from './fontTest/UIFontAliasInfo.test'
import measureOptionsTest from './textTest/measureOptionsTest.test';
import ContainerSpanModifierTest from './ContainerSpanTest/ContainerSpanModifier.test'
import SearchModifierTest from "./SearchTest/SearchModifier.test";
import SymbolGlyphFontWeightTest from "./SymbolGlyphTest/FontWeight01.test";
import SpanTextShadowTest from './textTest/SpanTextShadowTest.test';

export default function testsuite() {
    spanUIJsunit() // pass 7
    ActsRichEditorTest(); // pass 15,其余用例非法场景 // 12.9 复测  all fail
    textAreaInputTest() // pass 1
    stageFontTest(); // pass 5
    stageMediaquery(); // pass 13
    richEditorApi4(); // pass 1
    richEditorApi5(); // pass 1
    richEditorApi6(); // pass 1
    richEditorApi7(); // pass 1
    richEditorApi8(); // pass 1
    search(); // pass 96
    textStyleJsunit(); // pass 17
    marqueeJsunit(); // pass 3
    ImageTextTest(); //pass 7
    TextAreaCallbackTest(); //pass 1
    Image_QRCode_Api(); // pass 1
    RichEditorApi(); // pass 5


    APIgetUIFontConfigJsunit(); // pass 1
    TextAreaSelectTest(); // pass 10
    APITextBackgroundStyleJsunit(); // pass 1
    SXrenderingStrategyJsunit(); // pass 1
    SXsymbolSpanStyleJsunit(); // pass 1
    SXsymbolStyleJsunit(); // pass 1
    SXvalueResourceJsunit(); // pass 1
    SXSymbolGlyphSINGLE01Jsunit(); // pass 1
    textDataDataDetectorConfig() // pass 4
    richEditorApi2() // fail 1
    richEditorApi3() // pass 1
    RichEditorTest() // pass 3
    spanApi1() // pass 1
    symbolGlyphApi1() // pass 1
    symbolGlyphApi2() // pass 1
    symbolGlyphApi3() // pass 1
    symbolGlyphApi4() // pass 1
    symbolGlyphApi5() // pass 1
    symbolSpanApi2Test() // pass 2
    symbolSpanApi1() // pass 1
    TextStyle() // pass 8
    tabsDemo() // pass 1
    TextSelectionMenu() // pass 2
    textInputApi1() // pass 1
    textInputApiTest() // pass 1



    UIfont() // pass 4
    TextfieldOtherTest() // pass 4
    TextfieldSingleTest() // pass 3
    TextfieldMultiTest() // pass 4
    CurveTest() // pass 4
    backgroundAndSizeSettingJsunit() // pass 9
    borderJsunit(); // pass 3
    textAreaJsunit(); // pass 3
    textInputJsunit(); //pass 20
    propJsunit(); // pass 2
    spanJsunit() // pass 3
    textJsunit() // pass 9
    outline() // pass 4
    textAreaUxTest(); // pass 40
    search_caret(); // pass 5
    search_maxLength();// pass 2
    search_maxLength2(); // pass 2
    search_top(); // pass 1
    search_bottom();// pass 1
    textArea_top(); // pass 3
    textAenEnabledJsunit(); // pass 2
    textInput_caret(); // pass 1


    textOneJsunit(); // 4 pass
    textTwoJsunit();  // pass 5
    textEnabledJsunit(); // pass 6
    textChangeEnabledJsunit(); // pass 2
    marqueeUIJsunit();  // pass 8
    fontJsunit(); // pass 6
    textClockJsunit() // pass 6
    textTimerJsunit() // pass 3
    // appVersionCodeJsunit(); //fail 1 app died
    colorEnumJsunit(); // pass 1
    copyOptionJsunit(); // pass 2
    TextStyle2() // pass 1
    unitsModuleNameJsunit() // pass 4
    text3Jsunit(); // pass 11
    span3Jsunit(); // pass 5
    textMinFontSizeJsunit(); // pass 11
    textAreaOnCutJsunit(); // pass 8 注释 1 undefined
    textInputOnEditChangeJsunit(); // pass 9
    textAreaJsunit3(); // pass 13
    textInputJsunit3();  // pass 11
    textObscuredTest() // pass 5
    textSpanFontTest(); // pass 65
    textArea_bottom(); // pass 3
    textAreaOnCaretAndKeyboardTest(); // pass 2
    richEditorTest(); // pass 3
    textTextCaseTest(); // pass 3
    textTextDecorationTest(); // pass 5
    searchTest(); // pass 10


    textInputTest() // pass 36
    TextAreaTypeTest(); // pass 2
    SearchTypeTest(); // pass 2
    ImageSpanVisibilityTest(); // pass 5
    showCounterTest(); // pass 6
    UIFontAliasInfo(); // pass 1
    measureOptionsTest(); // pass 1
    ContainerSpanModifierTest(); // pass 2
    SearchModifierTest(); // pass 2
    SymbolGlyphFontWeightTest(); // pass 10
    SpanTextShadowTest(); // pass 3
}