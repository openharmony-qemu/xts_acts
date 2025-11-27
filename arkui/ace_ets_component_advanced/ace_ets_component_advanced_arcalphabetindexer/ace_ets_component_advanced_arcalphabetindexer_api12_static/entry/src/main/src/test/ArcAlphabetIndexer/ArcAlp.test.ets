'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from "../../../../hypium/index"
import {Color, FontStyle, BlurStyle} from '@ohos.arkui.component'

import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import events_emitter from '@ohos.events.emitter';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
// import { resourceManager } from '@kit.LocalizationKit';
const expectedFamily = 'HarmonyOS Sans';


// function dataPanelDefaultStrokeWidth(sysWidth: Resource) {
//   let resourceStrokeWidth = getContext().resourceManager.getNumber(sysWidth.id)
  // let newStrokeWidth: string = Math.round(px2vp(resourceStrokeWidth)) + '.00vp'
  // return newStrokeWidth;
// }

export default function ArcAlphabetIndexer() {
  describe('ArcAlphabetIndexer', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
      await UtilsTest.startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcAlp/ArcAlp',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ArcAlphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("ArcAlphabetIndexer" == pages.name)) {
          console.info("get ArcAlphabetIndexer state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ArcAlphabetIndexer page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("afterEach case");
    });

    afterAll(async (): Promise<void> => {
      console.info("afterAll case");
    });

    /*
   * @tc.number   ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100
   * @tc.name     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100
   * @tc.desc     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100
   * @tc.level    Level.LEVEL0
   */
    it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the functions of the ArcAlphabetIndexer component
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] START');
      let strJson = inspector.getInspectorByKey('arcAlphabetIndex01');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] attr: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] color: " + JSON.stringify(obj.getElement("$attrs").getString("color")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("popupColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedBackgroundColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedBackgroundColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] usePopup: " +
      JSON.stringify(obj.getElement("$attrs").getString("usePopup")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedFont.size " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedFont.style " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedFont.weight " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selectedFont.getString('family') " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] font.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] font.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] font.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] font.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupFont.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupFont.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupFont.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupFont.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] itemSize: " +
      JSON.stringify(obj.getElement("$attrs").getString('itemSize')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] selected: " +
      JSON.stringify(obj.getElement("$attrs").getString('selected')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] autoCollapse: " +
      JSON.stringify(obj.getElement("$attrs").getString('autoCollapse')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')));

      expect(obj.getElement("$attrs").getString("color")).assertEqual('#FFFFFFFF');
      expect(obj.getElement("$attrs").getString("selectedColor")).assertEqual('#FFFFFFFF');
      expect(obj.getElement("$attrs").getString("popupColor")).assertEqual('#FFFFFFFF');
      expect(obj.getElement("$attrs").getString("selectedBackgroundColor")).assertEqual('#FF1F71FF');
      expect(obj.getElement("$attrs").getString("usePopup")).assertEqual('false');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('size')).assertEqual('13.00fp');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('weight')).assertEqual('500');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getElement('font').getString('size')).assertEqual('13.00fp');
      expect(obj.getElement("$attrs").getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('font').getString('weight')).assertEqual('500');
      expect(obj.getElement("$attrs").getElement('font').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getElement('popupFont').getString('size')).assertEqual('19.00fp');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('weight')).assertEqual('500');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getString('itemSize')).assertEqual('24.00vp');
      expect(obj.getElement("$attrs").getString('selected')).assertEqual('0');
      expect(obj.getElement("$attrs").getString('autoCollapse')).assertEqual('true');
      expect(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')).assertEqual('BlurStyle.COMPONENT_REGULAR');
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0100] END');
      done();
    });

    /*
    * @tc.number   ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200
    * @tc.name     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200
    * @tc.desc     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200
    * @tc.level    Level.LEVEL0
    */
    it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the functions of the ArcAlphabetIndexer component
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] START');
      let strJson = inspector.getInspectorByKey('arcAlphabetIndex02');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] attr: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] color: " + JSON.stringify(obj.getElement("$attrs").getString("color")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("popupColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedBackgroundColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedBackgroundColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupBackground: " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupBackground')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] usePopup: " +
      JSON.stringify(obj.getElement("$attrs").getString("usePopup")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedFont.size " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedFont.style " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedFont.weight " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selectedFont.getString('family') " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] font.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] font.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] font.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] font.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupFont.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupFont.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupFont.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupFont.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] itemSize: " +
      JSON.stringify(obj.getElement("$attrs").getString('itemSize')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] selected: " +
      JSON.stringify(obj.getElement("$attrs").getString('selected')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] autoCollapse: " +
      JSON.stringify(obj.getElement("$attrs").getString('autoCollapse')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')));

      expect(obj.getElement("$attrs").getString("color")).assertEqual('#FFFFFAFA');
      expect(obj.getElement("$attrs").getString("selectedColor")).assertEqual('#FFFF0000');
      expect(obj.getElement("$attrs").getString("popupColor")).assertEqual('#FF00FF7F');
      expect(obj.getElement("$attrs").getString("selectedBackgroundColor")).assertEqual('#FF0000FF');
      expect(obj.getElement("$attrs").getElement('popupBackground')).assertEqual('#FF1F71FF');
      expect(obj.getElement("$attrs").getString("usePopup")).assertEqual('true');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('size')).assertEqual('10.00fp');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('weight')).assertEqual('200');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getElement('font').getString('size')).assertEqual('15.00fp');
      expect(obj.getElement("$attrs").getElement('font').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('font').getString('weight')).assertEqual('300');
      expect(obj.getElement("$attrs").getElement('font').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getElement('popupFont').getString('size')).assertEqual('20.00fp');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('weight')).assertEqual('400');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getString('itemSize')).assertEqual('20.00vp');
      expect(obj.getElement("$attrs").getString('selected')).assertEqual('1');
      expect(obj.getElement("$attrs").getString('autoCollapse')).assertEqual('false');
      expect(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')).assertEqual('BlurStyle.BACKGROUND_THIN');
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0200] END');
      done();
    });

    /*
    * @tc.number   ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300
    * @tc.name     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300
    * @tc.desc     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300
    * @tc.level    Level.LEVEL0
    */
    it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the functions of the ArcAlphabetIndexer component
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] START');
      let strJson = inspector.getInspectorByKey('arcAlphabetIndex03');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] attr: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] selectedFont.size " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] selectedFont.style " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] selectedFont.getString('fontWeight') " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('fontWeight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] selectedFont.getString('family') " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] font.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] font.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] font.getString('fontWeight'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('fontWeight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] font.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] popupFont.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupFont').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] popupFont.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupFont').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] popupFont.getString('fontWeight'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupFont').getString('fontWeight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] popupFont.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupFont').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] itemSize: " +
      JSON.stringify(obj.getElement("$attrs").getString('itemSize')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] selected: " +
      JSON.stringify(obj.getElement("$attrs").getString('selected')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] autoCollapse: " +
      JSON.stringify(obj.getElement("$attrs").getString('autoCollapse')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')));

      expect(obj.getElement("$attrs").getElement('selectedFont').getString('size')).assertEqual('10.00vp');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getElement('font').getString('size')).assertEqual('10.00vp');
      expect(obj.getElement("$attrs").getElement('font').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement("$attrs").getElement('font').getString('family')).assertEqual(expectedFamily);
      // expect(obj.getElement("$attrs").getElement('popupFont').getString('size')).assertEqual(dataPanelDefaultStrokeWidth($r('sys.float.ohos_id_text_size_headline7')));
      expect(obj.getElement("$attrs").getElement('popupFont').getString('style')).assertEqual('FontStyle.Italic');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('family')).assertEqual(expectedFamily);
      expect(obj.getElement("$attrs").getString('itemSize')).assertEqual('16.00vp');
      expect(obj.getElement("$attrs").getString('selected')).assertEqual('0');
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0300] END');
      done();
    });

    /*
    * @tc.number   ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400
    * @tc.name     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400
    * @tc.desc     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400
    * @tc.level    Level.LEVEL0
    */
    it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400',  Level.LEVEL0, async () => {
      console.info('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400 START');
      try {
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400 get state result is: " + JSON.stringify(indexEvent));
          const data = indexEvent.data as Record<String,undefined|null|Object>
          expect(data['STATUS'] as boolean).assertEqual(true);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60201,
          priority: events_emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('alphabetIndexer', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testalphabetIndexerOnSelect0012 END');
    });

    /*
    * @tc.number   ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500
    * @tc.name     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500
    * @tc.desc     ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500
    * @tc.level    Level.LEVEL0
    */
    it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the functions of the ArcAlphabetIndexer component
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] START');
      let backData: events_emitter.EventData = {
        data:{
          "color":'#FFFAFF',
          "selectedColor":Color.Yellow,
          "popupColor":'#00FF8F',
          "selectedBackgroundColor": Color.Pink,
          "usePopup":false,
          "selectedFontSize":'20.00fp',
          "selectedFontStyle": FontStyle.Normal,
          "selectedFontWeight": 300,
          "family":"openharmony",
          "fontSize":'25.00fp',
          "fontStyle":FontStyle.Normal,
          "fontWeight": 400,
          "popupFontSize":'40.00fp',
          "popupFontStyle" : FontStyle.Normal,
          "popupFontWeight" : 500,
          "itemSize" :30,
          "selected": 0,
          "autoCollapse": true,
          "popupBackground": Color.Black,
          "popupBackgroundBlurStyle" : BlurStyle.BACKGROUND_REGULAR
        } as Record<String,undefined|null|Object>
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("onSelect start to emit action state")
      events_emitter.emit(backEvent, backData)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('arcAlphabetIndex05');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] attr: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] color: " + JSON.stringify(obj.getElement("$attrs").getString("color")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("popupColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedBackgroundColor: " +
      JSON.stringify(obj.getElement("$attrs").getString("selectedBackgroundColor")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupBackground: " +
      JSON.stringify(obj.getElement("$attrs").getElement('popupBackground')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] usePopup: " +
      JSON.stringify(obj.getElement("$attrs").getString("usePopup")));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedFont.size " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedFont.style " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedFont.weight " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selectedFont.getString('family') " +
      JSON.stringify(obj.getElement("$attrs").getElement('selectedFont').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] font.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] font.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] font.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] font.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupFont.size: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('size')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupFont.style: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('style')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupFont.weight: " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('weight')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupFont.getString('family'): " +
      JSON.stringify(obj.getElement("$attrs").getElement('font').getString('family')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] itemSize: " +
      JSON.stringify(obj.getElement("$attrs").getString('itemSize')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] selected: " +
      JSON.stringify(obj.getElement("$attrs").getString('selected')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] autoCollapse: " +
      JSON.stringify(obj.getElement("$attrs").getString('autoCollapse')));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')));

      expect(obj.getElement("$attrs").getString("color")).assertEqual('#FFFFFAFF');
      expect(obj.getElement("$attrs").getString("selectedColor")).assertEqual('#FFFFFF00');
      expect(obj.getElement("$attrs").getString("popupColor")).assertEqual('#FF00FF8F');
      expect(obj.getElement("$attrs").getString("selectedBackgroundColor")).assertEqual('#FFFFC0CB');
      expect(obj.getElement("$attrs").getElement('popupBackground')).assertEqual('#FF000000');
      expect(obj.getElement("$attrs").getString("usePopup")).assertEqual('false');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('size')).assertEqual('20.00fp');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('weight')).assertEqual('300');
      expect(obj.getElement("$attrs").getElement('selectedFont').getString('family')).assertEqual("openharmony");
      expect(obj.getElement("$attrs").getElement('font').getString('size')).assertEqual('25.00fp');
      expect(obj.getElement("$attrs").getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('font').getString('weight')).assertEqual('400');
      expect(obj.getElement("$attrs").getElement('font').getString('family')).assertEqual("openharmony");
      expect(obj.getElement("$attrs").getElement('popupFont').getString('size')).assertEqual('40.00fp');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('style')).assertEqual('FontStyle.Normal');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('weight')).assertEqual('500');
      expect(obj.getElement("$attrs").getElement('popupFont').getString('family')).assertEqual("openharmony");
      expect(obj.getElement("$attrs").getString('itemSize')).assertEqual('30.00vp');
      expect(obj.getElement("$attrs").getString('selected')).assertEqual('0');
      expect(obj.getElement("$attrs").getString('autoCollapse')).assertEqual('true');
      expect(obj.getElement("$attrs").getString('popupBackgroundBlurStyle')).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_static_0500] END');
      done();
    });
  })
}
