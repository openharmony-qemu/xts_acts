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
import hilog from '@ohos.hilog'
import effectKit from '@ohos.effectKit';
import image from '@ohos.multimedia.image';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function GraphicEffectKitStaticTest() {

  describe("graphicEffectKitStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let pixelMap: image.PixelMap;
    beforeAll(() => {
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4,
          width: 6
        }
      };
      pixelMap = image.createPixelMapSync(color, opts);
    })
    /**
     * @tc.number    : effectKitTest_static_0100
     * @tc.name      : effectKitTest_static_0100
     * @tc.desc      : effect for test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it("effectKitTest_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      // effectKit test codes
      hilog.info(domain, tag, '%{public}s', 'effectKit test START');
      const opts: image.InitializationOptions = {
        size: { width: 400, height: 360},
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        alphaType: image.AlphaType.PREMUL,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        editable: true
      };
      let pixelMap = image.createPixelMapSync(opts);
      if (pixelMap == undefined) {
        hilog.info(domain, tag, '%{public}s', 'effectKit createPixelMapSync failed.');
        return undefined;
      };
      try {
        let headFilter: effectKit.Filter = effectKit.createEffect(pixelMap);
        console.info('www data succeed')
        if (headFilter == undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit createFilter failed.');
          return undefined;
        }
        let blurFilter: effectKit.Filter = headFilter.blur(10);
        expect(true).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'effectKit createFilter successfully.');
        const effectPixelMap = await blurFilter.getEffectPixelMap();
        if (effectPixelMap != undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap successfully.');
        } else {
          hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap failed.');
        }
        hilog.info(domain, tag, '%{public}s', 'effectKit test END');
        expect(true).assertTrue();
      } catch(err){
        console.info('www data err ' + JSON.stringify(err))
      }
      done();
    })

    /**
     * @tc.number     effectKitTest_static_0200
     * @tc.name       effectKitTest_static_0200
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let radius = 30;
          let headFilter = effectKit.createEffect(pixelMap);
          if (headFilter != null) {
            headFilter.blur(radius, effectKit.TileMode.CLAMP);
            expect(true).assertTrue();
            headFilter.blur(radius, effectKit.TileMode.REPEAT);
            expect(true).assertTrue();
            headFilter.blur(radius, effectKit.TileMode.MIRROR);
            expect(true).assertTrue();
            headFilter.blur(radius, effectKit.TileMode.DECAL);
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        } catch(err) {
          console.info('www data effectKitTest_static_0100 error ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number     effectKitTest_static_0300
     * @tc.name       effectKitTest_static_0300
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg = 'testTileMode'
        console.log(msg + ' begin')
        expect(effectKit.TileMode.CLAMP + '').assertEqual('0')
        expect(effectKit.TileMode.REPEAT + '').assertEqual('1')
        expect(effectKit.TileMode.MIRROR + '').assertEqual('2')
        expect(effectKit.TileMode.DECAL + '').assertEqual('3')
        done()
      })

    /**
     * @tc.number     effectKitTest_static_0400
     * @tc.name       effectKitTest_static_0400
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let bright1 = 0.0;
          let bright2 = 0.5;
          let bright3 = 1.0;
          let headFilter = effectKit.createEffect(pixelMap);
          if (headFilter != null) {
            headFilter.brightness(bright1);
            expect(true).assertTrue();
            headFilter.brightness(bright2);
            expect(true).assertTrue();
            headFilter.brightness(bright3);
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        } catch(err) {
          console.info('www data effectKitTest_static_0400 error ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number     effectKitTest_static_0500
     * @tc.name       effectKitTest_static_0500
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          headFilter.grayscale();
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.number     effectKitTest_static_0600
     * @tc.name       effectKitTest_static_0600
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          headFilter.invert();
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.number     effectKitTest_static_0700
     * @tc.name       effectKitTest_static_0700
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let colorMatrix:Array<number> = [
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0,0,0,1,0
        ];
        let headFilter = effectKit.createEffect(pixelMap);
        if (headFilter != null) {
          headFilter.setColorMatrix(colorMatrix);
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.number     effectKitTest_static_0800
     * @tc.name       effectKitTest_static_0800
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await effectKit.createColorPicker(pixelMap).then(async (colorPicker: effectKit.ColorPicker) => {
          console.info("www data color picker=" + colorPicker);
          await colorPicker.getMainColor().then((color: effectKit.Color) => {
            console.info('www data Succeeded in getting main color.');
            console.info(`www data color[ARGB]=${color?.alpha},${color?.red},${color?.green},${color.blue}`);
            expect(true).assertTrue();
          }).catch(err => {
            console.info('www data error getting main color.');
            expect().assertFail();
          })
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0800 error=");
          expect().assertFail();
        })
        done();
      })

    /**
     * @tc.number     effectKitTest_static_0900
     * @tc.name       effectKitTest_static_0900
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getMainColorSync();
            console.info('www data Succeeded in getMainColorSync.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getMainColorSync.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0900 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1000
     * @tc.name       effectKitTest_static_1000
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getLargestProportionColor();
            console.info('www data Succeeded in getLargestProportionColor.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getLargestProportionColor.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1000 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1100
     * @tc.name       effectKitTest_static_1100
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let colors = colorPicker.getTopProportionColors(2);
            console.info('www data Succeeded in getTopProportionColors.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getTopProportionColors.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1100 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1200
     * @tc.name       effectKitTest_static_1200
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getHighestSaturationColor();
            console.info('www data Succeeded in getHighestSaturationColor.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getHighestSaturationColor.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1200 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1300
     * @tc.name       effectKitTest_static_1300
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getAverageColor();
            console.info('www data Succeeded in getAverageColor.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getAverageColor.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1300 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1400
     * @tc.name       effectKitTest_static_1400
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let bJudge = colorPicker.isBlackOrWhiteOrGrayColor(0xFFFFFFFF);
            console.info('www data Succeeded in isBlackOrWhiteOrGrayColor.');
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to isBlackOrWhiteOrGrayColor.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1400 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1500
     * @tc.name       effectKitTest_static_1500
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          try {
            let color = colorPicker.getMainColorSync();
            console.info('www data Succeeded in getMainColorSync.' + JSON.stringify(color));
            console.info('www data color 123 ' + color?.red + '' + color?.blue + '' + color?.green + '' + color.alpha)
            expect(true).assertTrue();
          } catch (err) {
            console.error('www data Failed to getMainColorSync.');
            expect().assertFail();
          }
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_0900 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1600
     * @tc.name       effectKitTest_static_1600
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap).then((colorPicker: effectKit.ColorPicker) => {
          console.info("www data effectKitTest_static_1600 color picker=" + colorPicker);
          expect(true).assertTrue();
        }).catch( (reason) => {
          console.error("www data effectKitTest_static_1600 error=");
          expect().assertFail();
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1700
     * @tc.name       effectKitTest_static_1700
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap, (error, colorPicker) => {
          if (error) {
            console.error('www data Failed to create color picker.' + JSON.stringify(error));
            expect().assertFail();
          } else {
            console.info('www data Succeeded in creating color picker.');
            expect(true).assertTrue();
          }
        })
        done()
      })

    /**
     * @tc.number     effectKitTest_static_1800
     * @tc.name       effectKitTest_static_1800
     * @tc.desc       effect for test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it("effectKitTest_static_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        effectKit.createColorPicker(pixelMap, [0, 0, 1, 1], (error, colorPicker) => {
          if (error) {
            console.error('www data Failed to create color picker.' + JSON.stringify(error));
            expect().assertFail();
          } else {
            console.info('www data Succeeded in creating color picker.');
            expect(true).assertTrue();
          }
        })
        done()
      })

  })
}