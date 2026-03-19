import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import pointer from '@ohos.multimodalInput.pointer';
import hilog from '@ohos.hilog'
import { BusinessError } from "@ohos.base";
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import { $r } from '@kit.ArkUI'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gContext: common.UIAbilityContext | undefined;

export default function MultimodalSetCustomCursorTest() {

  describe("MultimodalSetCustomCursorTest", (): void => {

    beforeAll(async () => {
      hilog.info(0x0000, tag, "SetCustomCursorTest beforeAll start");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.pointertest.Static");
      await Utils.msSleep(2000);
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, tag, "SetCustomCursorTest beforeAll end");
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0100
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0100
     * @tc.desc   Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0100";
        gContext!.resourceManager.getMediaContent($r("app.media.app_icon").id).then((svgFileData) => {
          const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
          let svgImagesource: image.ImageSource | undefined = image.createImageSource(svgBuffer);
          let svgDecodingOptions: image.DecodingOptions = { desiredSize: { width: 50, height: 50 } };
          if (svgImagesource == undefined) {
            console.info(`${caseName} create image source failed`);
            expect(false).assertTrue();
            done();
          } else {
            svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
              if (pixelMap == undefined) {
                console.info(`${caseName} create pixelMap failed`);
                expect().assertFail();
                done();
              } else {
                try {
                  await pointer.setCustomCursor(-10000, pixelMap).then(() => {
                    console.info(`${caseName} setCustomCursor success`);
                    expect().assertFail();
                    done();
                  });
                } catch (error) {
                  console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,
                    [`code`, `message`])}`);
                  expect(error.code).assertEqual(401);
                  done();
                }
              }
            })
          }
        })
      })

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100
     * @tc.desc   Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100";
        let ifSetCustomCursorSyncSuccess = 0;
        const svgFileData =
          gContext!.resourceManager.getMediaContent($r("app.media.app_icon").id).then((svgFileData) => {
            const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
            let svgImagesource: image.ImageSource | undefined = image.createImageSource(svgBuffer);
            let svgDecodingOptions: image.DecodingOptions = { desiredSize: { width: 50, height: 50 } };
            if (svgImagesource == undefined) {
              console.info(`${caseName} create image source failed`);
              expect().assertFail();
              done();
            } else {
              svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
                if (pixelMap == undefined) {
                  console.info(`${caseName} create pixelMap failed`);
                  expect().assertFail();
                  done();
                } else {
                  try {
                    pointer.setCustomCursorSync(-10000, pixelMap, 25, 25);
                    console.info(`${caseName} setCustomCursorSync success`);
                    expect().assertFail();
                    done();
                  } catch (error) {
                    console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,
                      [`code`, `message`])}`);
                    expect(error.code).assertEqual(401);
                    done();
                  }
                }
              })
            }
          });
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0200
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0200
     * @tc.desc   Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0200";
        gContext!.resourceManager.getMediaContent($r("app.media.257x257").id).then((svgFileData) => {
          const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
          let svgImagesource: image.ImageSource | undefined = image.createImageSource(svgBuffer);
          let svgDecodingOptions: image.DecodingOptions = { desiredSize: { width: 1, height: 1 } };
          if (svgImagesource == undefined) {
            console.info(`${caseName} create image source failed`);
            expect(false).assertTrue();
            done();
          } else {
            svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
              if (!pixelMap) {
                console.info(`${caseName} create pixelMap failed`);
                expect().assertFail();
                done();
              }
              try {
                let CustomCursorTest: pointer.CustomCursor = {
                  pixelMap: pixelMap as image.PixelMap, focusX: 0, focusY: 0
                }
                let CursorConfigTest: pointer.CursorConfig = {
                  followSystem: true
                }
                await pointer.setCustomCursor(-10000, CustomCursorTest, CursorConfigTest).then(() => {
                  console.info(`${caseName} setCustomCursor success`);
                  expect().assertFail();
                  done();
                });
              } catch (error) {
                console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,
                  [`code`, `message`])}`);
                expect(error.code).assertEqual(401);
                done();
              }
            })
          }
        });
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setCustomCursor_0300
     * @tc.number SUB_MMI_Input_Api_Pointer_setCustomCursor_0300
     * @tc.desc   Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0300";
        gContext!.resourceManager.getMediaContent($r("app.media.257x257").id).then((svgFileData) => {
          const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
          let svgImagesource: image.ImageSource | undefined = image.createImageSource(svgBuffer);
          let svgDecodingOptions: image.DecodingOptions = { desiredSize: { width: 1, height: 1 } };
          if (svgImagesource == undefined) {
            console.info(`${caseName} create image source failed`);
            expect(false).assertTrue();
            done();
          } else {
            svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
              if (!pixelMap) {
                console.info(`${caseName} create pixelMap failed`);
                expect().assertFail();
                done();
              }
              try {
                let CustomCursorTest: pointer.CustomCursor = {
                  pixelMap: pixelMap as image.PixelMap, focusX: 0, focusY: 0
                }
                let CursorConfigTest: pointer.CursorConfig = {
                  followSystem: false
                }
                await pointer.setCustomCursor(10000, CustomCursorTest, CursorConfigTest).then(() => {
                  console.info(`${caseName} setCustomCursor success`);
                  expect().assertFail();
                  done();
                });
              } catch (error) {
                console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,
                  [`code`, `message`])}`);
                expect(error.code).assertEqual(26500001);
                done();
              }
            })
          }
        });
      });
  })
}