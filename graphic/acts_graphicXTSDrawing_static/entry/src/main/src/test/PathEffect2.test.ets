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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';

export default function PathEffect2() {

  describe('PathEffect2', () => {
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0100
     * @tc.desc   The property of PathDashStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let msg = " ====testPathDashStyle==== "
      try {
        console.info(msg + ' Succeeded in PathDashStyle.');
        expect(drawing.PathDashStyle.TRANSLATE == 0).assertTrue()
        expect(drawing.PathDashStyle.ROTATE == 1).assertTrue()
        expect(drawing.PathDashStyle.MORPH == 2).assertTrue()
        console.info(msg + ' drawing.PathDashStyle.TRANSLATE: ' + drawing.PathDashStyle.TRANSLATE);
        console.info(msg + ' drawing.PathDashStyle.ROTATE: ' + drawing.PathDashStyle.ROTATE);
        console.info(msg + ' drawing.PathDashStyle.MORPH: ' + drawing.PathDashStyle.MORPH);
        done()
      } catch (err) {
        console.log(msg + " Failed in drawing.PathDashStyle " + JSON.stringify(err))
        console.log(msg + " Failed in drawing.PathDashStyle " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0200
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathEffectCreateDiscretePathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let effect = drawing.PathEffect.createDiscretePathEffect(100, -50, 0);
          console.info(msg + ' drawing.PathEffect.createDiscretePathEffect: ' + effect);
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createDiscretePathEffect " + err)
          expect().assertFail()
          done()
        })
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0300
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathEffectCreateComposePathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let pathEffect1 = drawing.PathEffect.createCornerPathEffect(100);
          let pathEffect2 = drawing.PathEffect.createCornerPathEffect(10);
          if (pathEffect1 != undefined && pathEffect2 != undefined){
            let effect = drawing.PathEffect.createComposePathEffect(pathEffect1, pathEffect2);
            console.info(msg + ' drawing.PathEffect.createComposePathEffect: ' + effect);
          }else{
            expect().assertFail()
          }
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createComposePathEffect " + err)
          expect().assertFail()
          done()
        })
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0400
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathEffectCreateSumPathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let intervals: number[] = [10, 5];
          let pathEffectOne = drawing.PathEffect.createDashPathEffect(intervals, 5);
          let pathEffectTwo = drawing.PathEffect.createDashPathEffect(intervals, 10);
          if (pathEffectOne != undefined && pathEffectTwo != undefined){
            let effect = drawing.PathEffect.createSumPathEffect(pathEffectOne, pathEffectTwo);
            console.info(msg + ' drawing.PathEffect.createSumPathEffect: ' + effect);
          }else{
            expect().assertFail()
          }
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createSumPathEffect " + err)
          expect().assertFail()
          done()
        })
      })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0500
     * @tc.desc   The Interface of drawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_EFFECT_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====testPathEffectCreateDiscretePathEffect==== "
        const color = new ArrayBuffer(96);
        let opts : image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 4,
            width: 6
          }
        }
        image.createPixelMap(color, opts).then((pixelMap) => {
          const canvas = new drawing.Canvas(pixelMap);
          let effect = drawing.PathEffect.createDiscretePathEffect(100, -50);
          console.info(msg + ' drawing.PathEffect.createDiscretePathEffect: ' + effect);
          expect(effect != undefined).assertTrue();
          done()
        }).catch((err) => {
          console.log(msg + " Failed in drawing.PathEffect.createDiscretePathEffect " + err)
          expect().assertFail()
          done()
        })
      })

  })
}
