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
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from './Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const uiContext = new UIContext();

export default function GeneralLayoutOffsetTest() {
  describe('GeneralLayoutOffsetTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let screenHeight = display.getDefaultDisplaySync().height;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_right: number;
    let mirror_rect_left: number;
    let mirror_rect_top: number;
    let mirror_rect_right: number;

    beforeAll(() => {
      console.info("GeneralLayoutOffsetTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.GeneralLayout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/IndexOff',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IndexOff state success " + JSON.stringify(pages));
        if (!("IndexOff" == pages.name)) {
          console.info("get IndexOff state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          // console.info("push IndexOff page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexOff page error: " + err);
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_1900
     *@tc.name       : ArkUIHDS_General_Layout_1900
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_1900 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0100_Text');
      console.info('0100_Text START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0100_Text');
      console.info('0100_Text START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top).assertLargerOrEqual(99);
      expect(original_rect_top - top).assertLessOrEqual(101);
      expect(mirror_rect_top - top).assertLargerOrEqual(99);
      expect(mirror_rect_top - top).assertLessOrEqual(101);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2).assertLargerOrEqual(99);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2).assertLessOrEqual(101);
      console.info('ArkUIHDS_General_Layout_static_1900 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2000
     *@tc.name       : ArkUIHDS_General_Layout_2000
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2000 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0200_Button');
      console.info('0200_Button START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0200_Button');
      console.info('0200_Button START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_right - left).assertLargerOrEqual(width - (original_rect_left - left) - 1);
      expect(mirror_rect_right - left).assertLessOrEqual(width - (original_rect_left - left) + 1);
      expect(original_rect_top - top - 30).assertLargerOrEqual(UIContext.getFocusedUIContext()!.vp2px(120) - 1);
      expect(original_rect_top - top - 30).assertLessOrEqual(UIContext.getFocusedUIContext()!.vp2px(120) + 1);
      expect(mirror_rect_top - top - 30).assertLargerOrEqual(UIContext.getFocusedUIContext()!.vp2px(120) - 1);
      expect(mirror_rect_top - top - 30).assertLessOrEqual(UIContext.getFocusedUIContext()!.vp2px(120) + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(UIContext.getFocusedUIContext()!.vp2px(100) - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(UIContext.getFocusedUIContext()!.vp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_static_2000 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2100
     *@tc.name       : ArkUIHDS_General_Layout_2100
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2100 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0300_Image');
      console.info('0300_Image START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0300_Image');
      console.info('0300_Image START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 60).assertLargerOrEqual(uiContext.fp2px(200) - 1);
      expect(original_rect_top - top - 60).assertLessOrEqual(uiContext.fp2px(200) + 1);
      expect(mirror_rect_top - top - 60).assertLargerOrEqual(uiContext.fp2px(200) - 1);
      expect(mirror_rect_top - top - 60).assertLessOrEqual(uiContext.fp2px(200) + 1);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2)
        .assertLargerOrEqual(uiContext.fp2px(100) - 1);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2)
        .assertLessOrEqual(uiContext.fp2px(100) + 1);
      console.info('ArkUIHDS_General_Layout_static_2100 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2200
     *@tc.name       : ArkUIHDS_General_Layout_2200
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2200 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0400_Text');
      console.info('0400_Text START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0400_Text');
      console.info('0400_Text START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      mirror_rect_left = Number.parseInt(mirror_rect_left.toFixed(0));
      mirror_rect_right = Math.floor(mirror_rect_right);
      original_rect_top = Math.floor(original_rect_top);
      mirror_rect_top = Math.floor(mirror_rect_top);
      original_rect_right = Math.floor(original_rect_right);
      let lpx400 = Math.floor(uiContext.lpx2px(400));
      let lpx100 = Number.parseInt(uiContext.lpx2px(100).toFixed(0));
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 90).assertLargerOrEqual(lpx400 - 1);
      expect(original_rect_top - top - 90).assertLessOrEqual(lpx400 + 1);
      expect(mirror_rect_top - top - 90).assertLargerOrEqual(lpx400 - 1);
      expect(mirror_rect_top - top - 90).assertLessOrEqual(lpx400 + 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLargerOrEqual(lpx100 - 1);
      expect(((mirror_rect_left - left) + (mirror_rect_right - left)) / 2 - width / 2)
        .assertLessOrEqual(lpx100 + 1);
      console.info('ArkUIHDS_General_Layout_static_2200 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2300
     *@tc.name       : ArkUIHDS_General_Layout_2300
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2300 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0500_Button');
      console.info('0500_Button START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0500_Button');
      console.info('0500_Button START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      let width = right - left;
      expect(mirror_rect_left - left).assertLargerOrEqual(width - (original_rect_right - left) - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(width - (original_rect_right - left) + 1);
      expect(original_rect_top - top - 120).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 120).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 120).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 120).assertLessOrEqual(1);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2).assertLargerOrEqual(-1);
      expect(width / 2 - ((mirror_rect_left - left) + (mirror_rect_right - left)) / 2).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_2300 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2400
     *@tc.name       : ArkUIHDS_General_Layout_2400
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2400 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0600_Image');
      console.info('0600_Image START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0600_Image');
      console.info('0600_Image START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      let strJson3 = inspector.getInspectorByKey('bottom_off');
      let obj3: Record<string, Object> =
        JSON.parse<Object>(strJson3, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo3: Array<Array<number>> =
        JSON.parse<Object>('[' + obj3["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let right: number = rectInfo3[0][0] ?? 0;
      let bottom: number = rectInfo3[0][1] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      right = Math.floor(right);
      bottom = Math.floor(bottom);
      let width = right - left;
      original_rect_top = Math.floor(original_rect_top);
      original_rect_right = Number.parseInt(original_rect_right.toFixed(0));
      mirror_rect_top = Math.floor(mirror_rect_top);
      mirror_rect_left = Math.floor(mirror_rect_left);
      mirror_rect_right = Math.floor(mirror_rect_right);
      let mirrorwidth = Number.parseInt((((mirror_rect_left - left) + (mirror_rect_right - left)) / 2).toFixed(0));
      let mirrorleft = Number.parseInt(((mirror_rect_left - left) / 2).toFixed(0));
      let mirrorright = Number.parseInt(((width - (original_rect_right - left)) / 2).toFixed(0));
      expect(mirrorleft).assertLargerOrEqual(mirrorright - 1);
      expect(mirrorleft).assertLessOrEqual(mirrorright + 1);
      expect(original_rect_top - 150).assertLargerOrEqual(Math.floor((top + bottom) / 2) - 1);
      expect(original_rect_top - 150).assertLessOrEqual(Math.floor((top + bottom) / 2) + 1);
      expect(mirror_rect_top - 150).assertLargerOrEqual(Math.floor((top + bottom) / 2) - 1);
      expect(mirror_rect_top - 150).assertLessOrEqual(Math.floor((top + bottom) / 2) + 1);
      expect(mirrorwidth).assertLargerOrEqual(width - 1);
      expect(mirrorwidth).assertLessOrEqual(width + 1);
      console.info('ArkUIHDS_General_Layout_static_2400 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2500
     *@tc.name       : ArkUIHDS_General_Layout_2500
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2500 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0700_Image');
      console.info('0700_Image START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0700_Image');
      console.info('0700_Image START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      left = Number.parseInt(left.toFixed(0));
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 180).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 180).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 180).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_2500 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2600
     *@tc.name       : ArkUIHDS_General_Layout_2600
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2600 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0800_Button');
      console.info('0800_Button START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0800_Button');
      console.info('0800_Button START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 210).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 210).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 210).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_2600 END');
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2700
     *@tc.name       : ArkUIHDS_General_Layout_2700
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_static_2700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_General_Layout_static_2700 START');
      i18n.System.setAppPreferredLanguage("zh-Hans");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('0900_Text');
      console.info('0900_Text START  :' + JSON.stringify(strJson));
      let obj: Record<string, Object> =
        JSON.parse<Object>(strJson, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo: Array<Array<number>> =
        JSON.parse<Object>('[' + obj["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      original_rect_left = rectInfo[0][0] ?? 0;
      original_rect_top = rectInfo[0][1] ?? 0;
      original_rect_right = rectInfo[1][0] ?? 0;
      i18n.System.setAppPreferredLanguage("ar-EG");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('0900_Text');
      console.info('0900_Text START  :' + JSON.stringify(strJson1));
      let obj1: Record<string, Object> =
        JSON.parse<Object>(strJson1, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo1: Array<Array<number>> =
        JSON.parse<Object>('[' + obj1["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      mirror_rect_left = rectInfo1[0][0] ?? 0;
      mirror_rect_top = rectInfo1[0][1] ?? 0;
      mirror_rect_right = rectInfo1[1][0] ?? 0;
      let strJson2 = inspector.getInspectorByKey('top_off');
      let obj2: Record<string, Object> =
        JSON.parse<Object>(strJson2, Type.of(new String() as Object)) as Record<string, Object>;
      let rectInfo2: Array<Array<number>> =
        JSON.parse<Object>('[' + obj2["$rect"]! + ']', Type.of(new String() as Object)) as Array<Array<number>>;
      let top: number = rectInfo2[0][1] ?? 0;
      let left: number = rectInfo2[0][0] ?? 0;
      expect(mirror_rect_left - left).assertLargerOrEqual(original_rect_left - left - 1);
      expect(mirror_rect_left - left).assertLessOrEqual(original_rect_left - left + 1);
      expect(original_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(original_rect_top - top - 240).assertLessOrEqual(1);
      expect(mirror_rect_top - top - 240).assertLargerOrEqual(-1);
      expect(mirror_rect_top - top - 240).assertLessOrEqual(1);
      console.info('ArkUIHDS_General_Layout_static_2700 END');
      done();
    });

  })
}