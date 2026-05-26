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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import image from '@ohos.multimedia.image';
import effectKit from '@ohos.effectKit';
import { testPng, testJpg } from '../model/testImg';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import ohosWindow from '@ohos.window';


export default function effectKitTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  describe('effectKitTest', () => {
    console.log('describe effectKitTest start!!!');

    /**
     * @tc.name   createEffect1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_CREATEEFFECT_JSAPI_0001
     * @tc.desc   Create a FilterChain to add multiple effects to an image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createEffect1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createEffect1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let filter = effectKit.createEffect(pixelMap);
        expect(filter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   createEffect2
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_CREATEEFFECT_JSAPI_0002
     * @tc.desc   Create a FilterChain to add multiple effects to an image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createEffect2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'createEffect2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let pixelmap = null;
      let filter = effectKit.createEffect(pixelmap);
      expect(filter == null).assertTrue();
      done();
    })

    /**
     * @tc.name   blur1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0001
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur1 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(10);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur2
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0002
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest blur2 createEffect faild");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(-10);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur3
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0003
     * @tc.desc   A blur effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'blur3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur3 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(0);
        console.log(msgStr + "effectKitTest blur3 blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur4
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0004
     * @tc.desc   A blur effect is added to the image with TileMode.CLAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur4 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(15, effectKit.TileMode.CLAMP);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur5
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0005
     * @tc.desc   A blur effect is added to the image with TileMode.REPEAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur5 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(20, effectKit.TileMode.REPEAT);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur6
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0006
     * @tc.desc   A blur effect is added to the image with TileMode.MIRROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur6 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(25, effectKit.TileMode.MIRROR);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur7
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0007
     * @tc.desc   A blur effect is added to the image with TileMode.DECAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur7 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(30, effectKit.TileMode.DECAL);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur8
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0008
     * @tc.desc   Test blur with large radius value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur8 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(50);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur9
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0009
     * @tc.desc   Test blur with small radius value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur9 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let blurFilter = headFilter.blur(1);
        console.log(msgStr + "effectKitTest blurFilter ", blurFilter);
        expect(blurFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur10
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0010
     * @tc.desc   Test blur with chain calls and getPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur10 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(10).getPixelMap();
        console.log(msgStr + "effectKitTest blurFilter ", resultPixel);
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur11
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0011
     * @tc.desc   Test blur with getEffectPixelMap method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur11';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur11 createEffect failed");
          expect(true).assertFail();
          done();
        }
        headFilter.blur(12).getEffectPixelMap().then(data => {
          console.info(msgStr + 'getPixelBytesNumber = ', data.getPixelBytesNumber());
          expect(data != null).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(msgStr + 'failed to getEffectPixelMap ' + JSON.stringify(error));
          expect(true).assertFail();
          done();
        })
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   blur12
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BLUR_JSAPI_0012
     * @tc.desc   Test multiple blur effects in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blur12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'blur12';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest blur12 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(5).blur(10).getPixelMap();
        console.log(msgStr + "effectKitTest blurFilter ", resultPixel);
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   brightness1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BRIGHTNESS_JSAPI_0001
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest brightness1 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(0);
        console.log(msgStr + "effectKitTest blurFilter ", brightFilter);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   brightness2
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BRIGHTNESS_JSAPI_0002
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest brightness2 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(0.5);
        console.log(msgStr + "effectKitTest blurFilter ", brightFilter);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   brightness3
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_BRIGHTNESS_JSAPI_0003
     * @tc.desc   A Brightness effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('brightness3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'brightness3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log(msgStr + "effectKitTest brightness3 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let brightFilter = headFilter.brightness(-0.5);
        console.log(msgStr + "effectKitTest blurFilter ", brightFilter);
        expect(brightFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   grayscale1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GRAYSCALE_JSAPI_0001
     * @tc.desc   A Grayscale effect is added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('grayscale1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'grayscale1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest grayscale1 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let grayFilter = headFilter.grayscale();
        console.log(msgStr + "effectKitTest blurFilter ", grayFilter);
        expect(grayFilter != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMap1
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0001
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap1 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.getPixelMap();
        console.log(msgStr + "effectKitTest blurFilter ", resultPixel);
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMap2
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0002
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap2 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.grayscale().getPixelMap();
        console.log(msgStr + "effectKitTest blurFilter ", resultPixel);
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   getPixelMap3
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETPIXELMAP_JSAPI_0003
     * @tc.desc   Gets the PixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelMap3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'getPixelMap3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log("effectKitTest" + msgStr + 'begin');
      let imageSource = image.createImageSource(testJpg.buffer);
      let info = imageSource.getImageInfoSync();
      console.info(msgStr + "Napi size=" + info.size.width + " X " + info.size.height);
      expect(info.size.width).assertEqual(472);
      expect(info.size.height).assertEqual(226);
      imageSource.createPixelMap().then(pixelMap => {
        console.info(msgStr + "Napi create createEffect.start");
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter == null) {
          console.log("effectKitTest getPixelMap3 createEffect failed");
          expect(true).assertFail();
          done();
        }
        let resultPixel = headFilter.blur(5).brightness(0.5).grayscale().getPixelMap();
        console.log(msgStr + "effectKitTest blurFilter ", resultPixel);
        expect(resultPixel != null).assertTrue();
        done();
      }).catch((ex: BusinessError) => {
        console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
        expect(true).assertFail();
        done();
      })
    })

    /**
     * @tc.name   testGetEffectPixelMap_Functin_Promise
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_GETEFFECTPIXELMAP_JSAPI_0100
     * @tc.desc   Gets the getEffectPixelMap where all filter effects have been added to the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetEffectPixelMap_Functin_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'jsunittest testGetEffectPixelMap_Functin_Promise';
        console.log(msgStr + 'begin');
        const color = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: 3,
          size: {
            height: 4,
            width: 6
          }
        };
        try {
          let promise = image.createPixelMap(color, opts);
          promise.then((pixelMap) => {
            effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap().then(data => {
              console.log(msgStr + 'getPixelBytesNumber = ', data.getPixelBytesNumber());
              done();
            })
          }).catch((error: BusinessError) => {
            console.log(msgStr + 'failed to the getEffectPixelMap ' + JSON.stringify(error));
            expect(true).assertFail();
            done();
          })
        } catch (error) {
          console.log(msgStr + 'failed to the testGetEffectPixelMap_Functin_Promise' + JSON.stringify(error));
          expect(true).assertFail();
          done();
        }
      })

    /**
     * @tc.name   verifyFilterProperties
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_PROPERTIES_JSAPI_0001
     * @tc.desc   Verify the properties of filter object returned by createEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterProperties';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let filter = effectKit.createEffect(pixelMap);
          console.info(msgStr + "Filter object: " + JSON.stringify(filter));

          // Verify filter is not null or undefined
          expect(filter != null).assertTrue();
          expect(filter != undefined).assertTrue();

          // Verify filter is an object
          expect(typeof filter === 'object').assertTrue();

          // Verify filter has expected methods
          expect(typeof filter.blur === 'function').assertTrue();
          expect(typeof filter.brightness === 'function').assertTrue();
          expect(typeof filter.grayscale === 'function').assertTrue();
          expect(typeof filter.invert === 'function').assertTrue();
          expect(typeof filter.setColorMatrix === 'function').assertTrue();
          expect(typeof filter.getPixelMap === 'function').assertTrue();
          expect(typeof filter.getEffectPixelMap === 'function').assertTrue();

          console.info(msgStr + "All filter properties verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterMethodsReturn
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_METHODS_RETURN_JSAPI_0002
     * @tc.desc   Verify the return values of filter methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterMethodsReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterMethodsReturn';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test blur method returns filter object
          let blurFilter = headFilter.blur(10);
          expect(blurFilter != null).assertTrue();
          expect(typeof blurFilter.blur === 'function').assertTrue();
          expect(typeof blurFilter.brightness === 'function').assertTrue();

          // Test brightness method returns filter object
          let brightnessFilter = headFilter.brightness(0.5);
          expect(brightnessFilter != null).assertTrue();
          expect(typeof brightnessFilter.blur === 'function').assertTrue();
          expect(typeof brightnessFilter.grayscale === 'function').assertTrue();

          // Test grayscale method returns filter object
          let grayscaleFilter = headFilter.grayscale();
          expect(grayscaleFilter != null).assertTrue();
          expect(typeof grayscaleFilter.blur === 'function').assertTrue();
          expect(typeof grayscaleFilter.invert === 'function').assertTrue();

          // Test invert method returns filter object
          let invertFilter = headFilter.invert();
          expect(invertFilter != null).assertTrue();
          expect(typeof invertFilter.blur === 'function').assertTrue();
          expect(typeof invertFilter.brightness === 'function').assertTrue();

          console.info(msgStr + "All filter methods return verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterChainCalls
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_CHAIN_CALLS_JSAPI_0003
     * @tc.desc   Verify filter chain calls return correct objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterChainCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterChainCalls';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test single chain
          let chain1 = headFilter.blur(10);
          expect(chain1 != null).assertTrue();
          expect(typeof chain1.getPixelMap === 'function').assertTrue();

          // Test double chain
          let chain2 = headFilter.blur(10).brightness(0.5);
          expect(chain2 != null).assertTrue();
          expect(typeof chain2.getPixelMap === 'function').assertTrue();

          // Test triple chain
          let chain3 = headFilter.blur(10).brightness(0.5).grayscale();
          expect(chain3 != null).assertTrue();
          expect(typeof chain3.getPixelMap === 'function').assertTrue();

          // Test quadruple chain
          let chain4 = headFilter.blur(5).brightness(0.3).grayscale().invert();
          expect(chain4 != null).assertTrue();
          expect(typeof chain4.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "All filter chain calls verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterGetPixelMap
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_GETPIXELMAP_JSAPI_0004
     * @tc.desc   Verify getPixelMap method returns valid PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterGetPixelMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterGetPixelMap';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test getPixelMap on base filter
          let pixelMap1 = headFilter.getPixelMap();
          expect(pixelMap1 != null).assertTrue();
          expect(typeof pixelMap1 === 'object').assertTrue();
          expect(typeof pixelMap1.getImageInfo === 'function').assertTrue();

          // Test getPixelMap after blur
          let pixelMap2 = headFilter.blur(10).getPixelMap();
          expect(pixelMap2 != null).assertTrue();
          expect(typeof pixelMap2 === 'object').assertTrue();
          expect(typeof pixelMap2.getPixelBytesNumber === 'function').assertTrue();

          // Test getPixelMap after chain
          let pixelMap3 = headFilter.blur(5).brightness(0.5).getPixelMap();
          expect(pixelMap3 != null).assertTrue();
          expect(typeof pixelMap3 === 'object').assertTrue();

          console.info(msgStr + "All getPixelMap calls verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterGetEffectPixelMap
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_GETEFFECTPIXELMAP_JSAPI_0005
     * @tc.desc   Verify getEffectPixelMap method returns valid PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterGetEffectPixelMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterGetEffectPixelMap';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test getEffectPixelMap after blur
          headFilter.blur(10).getEffectPixelMap().then(data => {
            expect(data != null).assertTrue();
            expect(typeof data === 'object').assertTrue();
            expect(typeof data.getPixelBytesNumber === 'function').assertTrue();
            let bytes = data.getPixelBytesNumber();
            expect(bytes > 0).assertTrue();
            console.info(msgStr + "getEffectPixelMap bytes: " + bytes);
            done();
          }).catch((error: BusinessError) => {
            console.error(msgStr + "getEffectPixelMap error: " + JSON.stringify(error));
            expect(true).assertFail();
            done();
          })
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterSetColorMatrix
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_SETCOLORMATRIX_JSAPI_0006
     * @tc.desc   Verify setColorMatrix method behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterSetColorMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterSetColorMatrix';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        await imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test setColorMatrix returns filter object
          let colorMatrix: Array<number> = [
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0, 0, 0, 1, 0
          ];
          let result = headFilter.setColorMatrix(colorMatrix);
          expect(result != null).assertTrue();
          expect(typeof result.blur === 'function').assertTrue();
          expect(typeof result.getPixelMap === 'function').assertTrue();

          // Test chain with colorMatrix
          let chainResult = headFilter.setColorMatrix(colorMatrix).blur(5);
          expect(chainResult != null).assertTrue();
          expect(typeof chainResult.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "setColorMatrix verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

    /**
     * @tc.name   verifyFilterWithDifferentTileModes
     * @tc.number SUB_GRAPHIC_GRAPHICS_EFFECT_EFFECT_KIT_FILTER_TILEMODES_JSAPI_0007
     * @tc.desc   Verify filter with different TileMode parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('verifyFilterWithDifferentTileModes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'verifyFilterWithDifferentTileModes';
        let msgStr = 'jsunittest effectKitTest' + caseName + ' ';
        console.log(msgStr + 'begin');
        let imageSource = image.createImageSource(testJpg.buffer);
        console.info(msgStr + "promise create pixmap.start");
        imageSource.createPixelMap().then(pixelMap => {
          console.info(msgStr + "Napi create Effect.start");
          let headFilter = effectKit.createEffect(pixelMap);

          // Test with CLAMP
          let filter1 = headFilter.blur(10, effectKit.TileMode.CLAMP);
          expect(filter1 != null).assertTrue();
          expect(typeof filter1.getPixelMap === 'function').assertTrue();

          // Test with REPEAT
          let filter2 = headFilter.blur(10, effectKit.TileMode.REPEAT);
          expect(filter2 != null).assertTrue();
          expect(typeof filter2.getPixelMap === 'function').assertTrue();

          // Test with MIRROR
          let filter3 = headFilter.blur(10, effectKit.TileMode.MIRROR);
          expect(filter3 != null).assertTrue();
          expect(typeof filter3.getPixelMap === 'function').assertTrue();

          // Test with DECAL
          let filter4 = headFilter.blur(10, effectKit.TileMode.DECAL);
          expect(filter4 != null).assertTrue();
          expect(typeof filter4.getPixelMap === 'function').assertTrue();

          console.info(msgStr + "All TileMode filters verified successfully");
          done();
        }).catch((ex: BusinessError) => {
          console.error(msgStr + "Napi pixelMap.error=" + ex.toString());
          expect(true).assertFail();
          done();
        })
      })

  })
}