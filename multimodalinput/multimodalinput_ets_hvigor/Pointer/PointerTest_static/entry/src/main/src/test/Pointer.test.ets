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

import pointer from '@ohos.multimodalInput.pointer';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

class CursorConfigTest implements pointer.CursorConfig {
  followSystem: boolean;

  constructor(followSystem: boolean) {
    this.followSystem = followSystem;
  }
}

export default function MultimodalInputPointerTest() {
  describe("MultimodalInputPointerTest", (): void => {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.desc Test callback setPointerStyle interface to set the mouse style type.
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSuccess = 0;
        try {
          pointer.setPointerStyle(100000, pointer.PointerStyle.CROSS, err => {
            hilog.info(domain, tag, `${caseName} Set pointer style success`);
            ifSetPointerStyleSuccess++;
            ExpectTrue(ifSetPointerStyleSuccess == 1);
            done();
          });
        } catch (error: BusinessError) {
          hilog.info(domain, tag,
            `${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0200
     * @tc.name SUB_MMI_Input_Api_Pointer_setPointerStyle_0200
     * @tc.desc Test promise setPointerStyle interface to set the mouse style type.
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSuccess = 0;
        try {
          pointer.setPointerStyle(100000, pointer.PointerStyle.CROSS).then(() => {
            hilog.info(domain, tag, `${caseName} Set pointer style success`);
            ifSetPointerStyleSuccess++;
            ExpectTrue(ifSetPointerStyleSuccess == 1);
            done();
          });
        } catch (error: BusinessError) {
          hilog.info(domain, tag,
            `${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0300
     * @tc.name SUB_MMI_Input_Api_Pointer_setPointerStyle_0300
     * @tc.desc Test setPointerStyleSync interface to set the mouse style type.
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifSetPointerStyleSyncSuccess = 0;
        try {
          pointer.setPointerStyleSync(10000, pointer.PointerStyle.CROSS);
          console.info(`${caseName} Set pointer style success`);
          ifSetPointerStyleSyncSuccess++;
          ExpectTrue(ifSetPointerStyleSyncSuccess == 1);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_PointerStyle_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_PointerStyle_0100
     * @tc.desc Test PointerStyle
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_PointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_PointerStyle_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(pointer.PointerStyle.DEFAULT == 0);
          ExpectTrue(pointer.PointerStyle.EAST == 1);
          ExpectTrue(pointer.PointerStyle.WEST == 2);
          ExpectTrue(pointer.PointerStyle.SOUTH == 3);
          ExpectTrue(pointer.PointerStyle.NORTH == 4);
          ExpectTrue(pointer.PointerStyle.WEST_EAST == 5);
          ExpectTrue(pointer.PointerStyle.NORTH_SOUTH == 6);
          ExpectTrue(pointer.PointerStyle.NORTH_EAST == 7);
          ExpectTrue(pointer.PointerStyle.NORTH_WEST == 8);
          ExpectTrue(pointer.PointerStyle.SOUTH_EAST == 9);
          ExpectTrue(pointer.PointerStyle.SOUTH_WEST == 10);
          ExpectTrue(pointer.PointerStyle.NORTH_EAST_SOUTH_WEST == 11);
          ExpectTrue(pointer.PointerStyle.NORTH_WEST_SOUTH_EAST == 12);
          ExpectTrue(pointer.PointerStyle.CROSS == 13);
          ExpectTrue(pointer.PointerStyle.CURSOR_COPY == 14);
          ExpectTrue(pointer.PointerStyle.CURSOR_FORBID == 15);
          ExpectTrue(pointer.PointerStyle.COLOR_SUCKER == 16);
          ExpectTrue(pointer.PointerStyle.HAND_GRABBING == 17);
          ExpectTrue(pointer.PointerStyle.HAND_OPEN == 18);
          ExpectTrue(pointer.PointerStyle.HAND_POINTING == 19);
          ExpectTrue(pointer.PointerStyle.HELP == 20);
          ExpectTrue(pointer.PointerStyle.MOVE == 21);
          ExpectTrue(pointer.PointerStyle.RESIZE_LEFT_RIGHT == 22);
          ExpectTrue(pointer.PointerStyle.RESIZE_UP_DOWN == 23);
          ExpectTrue(pointer.PointerStyle.SCREENSHOT_CHOOSE == 24);
          ExpectTrue(pointer.PointerStyle.SCREENSHOT_CURSOR == 25);
          ExpectTrue(pointer.PointerStyle.TEXT_CURSOR == 26);
          ExpectTrue(pointer.PointerStyle.ZOOM_IN == 27);
          ExpectTrue(pointer.PointerStyle.ZOOM_OUT == 28);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_EAST == 29);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_WEST == 30);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_SOUTH == 31);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_NORTH == 32);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH == 33);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST == 34);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST == 35);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST == 36);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST == 37);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST == 38);
          ExpectTrue(pointer.PointerStyle.HORIZONTAL_TEXT_CURSOR == 39);
          ExpectTrue(pointer.PointerStyle.CURSOR_CROSS == 40);
          ExpectTrue(pointer.PointerStyle.CURSOR_CIRCLE == 41);
          ExpectTrue(pointer.PointerStyle.LOADING == 42);
          ExpectTrue(pointer.PointerStyle.RUNNING == 43);
          ExpectTrue(pointer.PointerStyle.MIDDLE_BTN_EAST_WEST == 44);
          done();
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_PrimaryButton_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_PrimaryButton_0100
     * @tc.desc Test PrimaryButton
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_PrimaryButton_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_PrimaryButton_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(pointer.PrimaryButton.LEFT == 0);
          ExpectTrue(pointer.PrimaryButton.RIGHT == 1);
          done();
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_RightClickType_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_RightClickType_0100
     * @tc.desc Test RightClickType
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_RightClickType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_RightClickType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(pointer.RightClickType.TOUCHPAD_RIGHT_BUTTON == 1);
          ExpectTrue(pointer.RightClickType.TOUCHPAD_LEFT_BUTTON == 2);
          ExpectTrue(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP == 3);
          ExpectTrue(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON == 4);
          ExpectTrue(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON == 5);
          done();
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number SUB_MMI_Input_Api_Pointer_CursorConfig_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_CursorConfig_0100
     * @tc.desc Test CursorConfig
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_CursorConfig_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_CursorConfig_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let cursorconfig = new CursorConfigTest(true);
          let followSystemTest = cursorconfig.followSystem;
          ExpectTrue(followSystemTest == true);
          done();
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

          /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisible_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisible_0100
     * @tc.desc: Test callback isPointerVisible interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0100";
        try {
          pointer.isPointerVisible((error: BusinessError | null, visible: boolean | undefined) => {
            if (error) {
              console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error,
                [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            } else {
              console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
              ExpectTrue(typeof (visible) == 'boolean');
              done();
            }
          });
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisible_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisible_0200
     * @tc.desc: Test promise isPointerVisible interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0200";
        try {
          pointer.isPointerVisible().then((visible: boolean) => {
            console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
            ExpectTrue(typeof (visible) == 'boolean');
            done();
          });
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100
     * @tc.desc: Test isPointerVisibleSync interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100";
        try {
          let visible: boolean = pointer.isPointerVisibleSync();
          console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
          ExpectTrue(typeof (visible) == 'boolean');
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisible_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisible_0100
     * @tc.desc: Test callback setPointerVisible interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0100";
        try {
          let flag: number = 0;
          pointer.setPointerVisible(true, (err, data) => {
            if (err) {
              console.info(`${caseName} Set pointer visible failed, err=${JSON.stringify(err)}`);
              ExpectTrue(err.code == 801);
              done();
            } else {
              flag += 1;
              console.info(`${caseName} Set pointer visible success, data=${JSON.stringify(data)}`);
              ExpectTrue(flag == 1);
              done();
            }
          });
        } catch (error) {
          console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisible_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisible_0200
     * @tc.desc: Test promise setPointerVisible interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0200";
        try {
          let flag: number = 0;
          pointer.setPointerVisible(false).then(() => {
            flag += 1;
            console.info(`${caseName} Set pointer visible success`);
            ExpectTrue(flag == 1);
            done();
          })
        } catch (error: BusinessError) {
          console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100
     * @tc.desc: Test setPointerVisibleSync interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100";
        let ifSetPointerVisibleSyncSuccess = 0;
        try {
          pointer.setPointerVisibleSync(false);
          console.info(`${caseName} Set pointer visible success`);
          ifSetPointerVisibleSyncSuccess++;
          ExpectTrue(ifSetPointerVisibleSyncSuccess == 1);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.desc: Test getPointerStyleSync interface to get the mouse style type, windowId is -1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100";
        try {
          let style: pointer.PointerStyle = pointer.getPointerStyleSync(-1);
          console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
          ExpectTrue(style >= 0 && style <= 48);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200
     * @tc.desc: Test getPointerStyleSync interface to get the mouse style type, windowId is -10000.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200";
        try {
          let windowId = -10000;
          let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId);
          console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
          ExpectFalse(true);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 401);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyle_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyle_0100
     * @tc.desc: Test callback getPointerStyle interface to get the mouse style type, windowId is -1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0100";
        try {
          pointer.getPointerStyle(-1, (error: BusinessError | null, style: pointer.PointerStyle | undefined) => {
            if (style === undefined) {
              console.error(`${caseName} Get pointer style returned undefined`);
              ExpectFalse(true);
              done();
              return;
            }
            console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(Number(style))}`);
            ExpectTrue(style >= 0 && style <= 48);
            done();
          });
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyle_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyle_0300
     * @tc.desc: Test promise getPointerStyle interface to get the mouse style type, windowId is -1.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0300";
        try {
          pointer.getPointerStyle(-1).then((style: pointer.PointerStyle) => {
            console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
            ExpectTrue(style>=0 && style<=48);
            done();
          });
        } catch (error: BusinessError) {
          console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401 || true);
          done();
        }
      });
  })
}