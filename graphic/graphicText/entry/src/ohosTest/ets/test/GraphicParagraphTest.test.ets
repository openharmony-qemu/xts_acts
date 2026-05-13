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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "@ohos/hypium";
import text from "@ohos.graphics.text";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';

export default function GraphicParagraphTest() {

  describe('GraphicParagraphTest', () => {

    /**
     * @tc.name   testForceReuseRasterResultTrue
     * @tc.number SUB_GRAPHIC_Paragraph_forceReuseRasterResultTrue_0100
     * @tc.desc   Test Paragraph forceReuseRasterResult with true value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForceReuseRasterResultTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testForceReuseRasterResultTrue===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试强制复用光栅化结果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);

          paragraph.forceReuseRasterResult(true);
          paragraph.paint(canvas, 10, 10);

          console.info(msgStr + ' paint success with forceReuseRasterResult true');
          console.info(msgStr + ' end');
          await pixelMap.release();
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testForceReuseRasterResultFalse
     * @tc.number SUB_GRAPHIC_Paragraph_forceReuseRasterResultFalse_0200
     * @tc.desc   Test Paragraph forceReuseRasterResult with false value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForceReuseRasterResultFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testForceReuseRasterResultFalse===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试允许更新光栅化结果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);

          paragraph.forceReuseRasterResult(false);
          paragraph.paint(canvas, 10, 10);

          console.info(msgStr + ' paint success with forceReuseRasterResult false');
          console.info(msgStr + ' end');
          await pixelMap.release();
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testForceReuseRasterResultNullUndefined
     * @tc.number SUB_GRAPHIC_Paragraph_forceReuseRasterResultFalse_0300
     * @tc.desc   Test Paragraph forceReuseRasterResult with null value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForceReuseRasterResultNullUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testForceReuseRasterResultNullUndefined===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试允许更新光栅化结果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
          try {
            paragraph.forceReuseRasterResult(null);
            console.info(msgStr + ' forceReuseRasterResult success null');
            expect().assertFail();
          } catch(err){
            console.info(msgStr + ' forceReuseRasterResult failed null', err.code);
            expect(err.code).assertEqual(401);
          }
          try {
            paragraph.forceReuseRasterResult(undefined);
            console.info(msgStr + ' forceReuseRasterResult success undefined');
            expect().assertFail();
          } catch(err){
            console.info(msgStr + ' forceReuseRasterResult failed undefined', err.code);
            expect(err.code).assertEqual(401);
          }
          paragraph.paint(canvas, 10, 10);
          console.info(msgStr + ' paint success with forceReuseRasterResult false');
          console.info(msgStr + ' end');
          await pixelMap.release();
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}
