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

import ImageSpanVisibilityTest from './ImageSpanTest/ImageSpanVisibility.test';
import APITextBackgroundStyleJsunit from './ContainerSpanTest/APITextBackgroundStyleJsunit.test';
import ContainerSpanModifierTest from './ContainerSpanTest/ContainerSpanModifier.test';
import marqueeJsunit from './marqueeTest/MarqueeJsunit.test';
import marqueeUIJsunit from './marqueeTest/marqueeUIJsunit.test.ets';
import search_bottom from './SearchTest/search_bottom.test.ets';
import search_caret from './SearchTest/search_caret.test';
import search_maxLength from './SearchTest/search_maxLength.test';
import search_maxLength2 from './SearchTest/search_maxLength2.test';
import search_top from './SearchTest/search_top.test.ets';
import searchTest from './SearchTest/SearchJsunit1.test';
import SearchModifierTest from "./SearchTest/SearchModifier.test";
import search from './SearchTest/SearchTest.test';
import SearchTypeTest from "./SearchTest/SearchType.test";
import span3Jsunit from './spanTest/Span3Jsunit.test';
import spanApi1 from './spanTest/spanApi/spanApi1.test';
import spanJsunit from './spanTest/SpanJsunit.test';
import spanUIJsunit from './spanTest/spanUIJsunit.test.ets';
import SymbolGlyphFontWeightTest from "./SymbolGlyphTest/fontWeight.test";
import SXSymbolGlyphSINGLE01Jsunit from './SymbolGlyphTest/SXSymbolGlyphSINGLE01Jsunit.test';
import symbolGlyphApi1 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi1.test';
import symbolGlyphApi2 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi2.test';
import symbolGlyphApi3 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi3.test';
import symbolGlyphApi4 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi4.test';
import symbolGlyphApi5 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi5.test';
import symbolSpanApi1 from './symbolSpanTest/symbolSpanApi/symbolSpanApi1.test';
import symbolSpanApi2Test from './symbolSpanTest/symbolSpanApi/symbolSpanApi2.test';
import SXvalueResourceJsunit from './RichEditorTest/SXvalueResourceJsunit.test';

export default function testsuite() {
    ImageSpanVisibilityTest();
    APITextBackgroundStyleJsunit();
    ContainerSpanModifierTest();
    marqueeJsunit();
    marqueeUIJsunit();
    search_bottom();
    search_caret();
    search_top();
    search_maxLength();
    search_maxLength2();
    searchTest();
    SearchModifierTest();
    search();
    SearchTypeTest();
    span3Jsunit();
    spanApi1();
    spanJsunit();
    spanUIJsunit();
    SymbolGlyphFontWeightTest();
    SXSymbolGlyphSINGLE01Jsunit();
    symbolGlyphApi1();
    symbolGlyphApi2();
    symbolGlyphApi3();
    symbolGlyphApi4();
    symbolGlyphApi5();
    symbolSpanApi1();
    symbolSpanApi2Test();
    SXvalueResourceJsunit();
}
