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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ArcAlphabetIndexerAttributeTest() {

  describe('ArcAlphabetIndexerAttributeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcAlphabetIndexerColorTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERCOLOR_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_COLOR with COLOR_RED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerColorTest_002
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERCOLOR_TEST_0200
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_COLOR with COLOR_GREEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerColor002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerSelectedColorTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERSELECTEDCOLOR_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_SELECTED_COLOR with COLOR_BLUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerSelectedColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerSelectedColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerSelectedTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERSELECTED_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_SELECTED with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerSelected001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerSelected001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerSelectedTest_002
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERSELECTED_TEST_0200
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_SELECTED with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerSelected002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerSelected002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetPopupBackgroundBlurStyleTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETPOPUPBACKGROUNDBLURSTYLE_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_POPUP_BACKGROUND_BLUR_STYLE with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetPopupBackgroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetPopupBackgroundBlurStyle001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerItemSizeTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERITEMSIZE_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE with value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerItemSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerItemSize001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerItemSizeTest_002
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERITEMSIZE_TEST_0200
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_ITEM_SIZE with value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerItemSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerItemSize002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetFontTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETFONT_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_FONT with value 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetFont001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerUsePopupTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERUSEPOPUP_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_USE_POPUP with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerUsePopup001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerUsePopup001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerPopupFontTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERPOPUPFONT_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_POPUP_FONT with value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerPopupFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerPopupFont001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerSelectedBackgroundColorTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERSELECTEDBACKGROUNDCOLOR_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_SELECTED_BACKGROUND_COLOR with COLOR_YELLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerSelectedBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerSelectedBackgroundColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetAutoCollapseTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETAUTOCOLLAPSE_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_AUTO_COLLAPSE with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetAutoCollapse001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetAutoCollapse001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetSelectedFontTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETSELECTEDFONT_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_SELECTED_FONT with value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetSelectedFont001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetSelectedFont001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerPopupColorTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERPOPUPCOLOR_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_POPUP_COLOR with COLOR_PURPLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerPopupColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerPopupColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerPopupBackgroundColorTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERPOPUPBACKGROUNDCOLOR_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_COLOR with COLOR_GRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerPopupBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerPopupBackgroundColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcAlphabetIndexerArrayTest_001
     * @tc.number SUB_ARKUI_ARCALPHABETINDEXERARRAY_TEST_0100
     * @tc.desc   Test NODE_ARC_ALPHABET_INDEXER_ARRAY with alphabet array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcAlphabetIndexerArray001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcAlphabetIndexerArray001()).assertEqual(0)
      done()
    })
  })
}