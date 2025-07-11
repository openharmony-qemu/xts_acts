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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';
// import { resourceManager } from '@kit.LocalizationKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import { $r } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


export default function searchTest() {
  describe('searchTest', () => {
    beforeAll(() => {
      console.info("searchTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/searchTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get searchTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push searchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchTest page error:" + err);
      }
      console.info("searchTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("search after each called");
    })

    const abilityStageContext =
      AppStorage.get<common.AbilityStageContext>('stageContext', Type.from<common.AbilityStageContext>()) as common.AbilityStageContext;
    let resourceSize = abilityStageContext.resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)

    /**
     * @tc.number testSearchSelectionMenuHidden01
     * @tc.name Test the Search property of the SelectionMenuHidden component
     * @tc.desc set the SelectionMenuHidden property value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    /** .key()取不到属性值 */
    // it('testSelectionMenuHidden01', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   let tagName = 'testSearchSelectionMenuHidden01';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = inspector.getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj:ESObject = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.selectionMenuHidden).assertEqual("false");

    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "typeValue": 1,
    //       }
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 1401,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info('[' + tagName + '] start to publish emit');
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err: Error) {
    //     console.log('[' + tagName + '] change component data error: ' + err.message);
    //   }
    //   await Utils.sleep(2000);
    //   let strJsonNew = inspector.getInspectorByKey('search');
    //   let objNew = JSON.parse(strJsonNew);
    //   console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
    //   expect(objNew.$attrs.selectionMenuHidden).assertEqual("false");
    //   expect(objNew.$type).assertEqual('Search');

    //   console.info('[' + tagName + '] END ===========================');
    //   done();
    // });

    /**
     * @tc.number testSearchCaretStyle_static_02
     * @tc.name testSearchCaretStyle_static_02
     * @tc.desc set the CaretStyle property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchCaretStyle_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCaretStyle02';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 2,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1501,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(JSON.stringify(objNew.getElement('$attrs').getString('caretStyle')))
        .assertEqual("{\"color\":\"#FF000000\",\"width\":\"10.00vp\"}");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number testSearchEnableKeyboardOnFocus03
     * @tc.name Test the Search property of the EnableKeyboardOnFocus component
     * @tc.desc set the EnableKeyboardOnFocus property value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    /** .key()取不到属性值 */
    // it('testSearchEnableKeyboardOnFocus03', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   let tagName = 'testSearchEnableKeyboardOnFocus03';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //   let strJson = inspector.getInspectorByKey('search');
    //   console.info('[' + tagName + '] component obj is: ' + strJson);
    //   let obj = JSON.parse(strJson);
    //   expect(obj.$type).assertEqual('Search');
    //   expect(obj.$attrs.enableKeyboardOnFocus).assertEqual("true");

    //   try {
    //     let eventData: events_emitter.EventData = {
    //       data: {
    //         "typeValue": 3,
    //       }
    //     }
    //     let innerEvent: events_emitter.InnerEvent = {
    //       eventId: 1601,
    //       priority: events_emitter.EventPriority.LOW
    //     }
    //     console.info('[' + tagName + '] start to publish emit');
    //     events_emitter.emit(innerEvent, eventData);
    //   } catch (err: Error) {
    //     console.log('[' + tagName + '] change component data error: ' + err.message);
    //   }
    //   await Utils.sleep(2000);
    //   let strJsonNew = inspector.getInspectorByKey('search');
    //   let objNew = JSON.parse(strJsonNew);
    //   console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
    //   expect(objNew.$attrs.enableKeyboardOnFocus).assertEqual("false");
    //   expect(objNew.$type).assertEqual('Search');

    //   console.info('[' + tagName + '] END ===========================');
    //   done();
    //   });

    /**
     * @tc.number testSearchPlaceholderFont_static_04
     * @tc.name testSearchPlaceholderFont_static_04
     * @tc.desc set the PlaceholderFont property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchPlaceholderFont_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchPlaceholderFont04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Search');

      expect(obj.getElement('$attrs').getString('placeholderFont'))
        .assertEqual('{"style":"FontStyle.Normal","size":"' + uiContext.px2fp(resourceSize) +
          '.00fp","weight":"400","fontFamily":"sans-serif"}');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 4,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1701,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('placeholderFont'))
        .assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.getElement('$attrs').getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchSearchIcon05
     * @tc.name testSearchSearchIcon_static_05
     * @tc.desc set the SearchIcon property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchSearchIcon_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchSearchIcon05';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 5,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      const uiContext = new UIContext();
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(JSON.stringify(objNew.getElement('$attrs').getString('searchIcon')))
        .assertEqual(`{\"size\":\"${uiContext.vp2px(30)
          .toFixed(2)}px\",\"color\":\"#FFFF0000\",\"src\":\"resource:///ohos_search.svg\"}`);
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchSearchButton06
     * @tc.name testSearchSearchButton_static_06
     * @tc.desc set the SearchButton property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchSearchButton_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchSearchButton06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getElement('searchButton')).assertEqual("");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 6,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1901,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('searchButton')).assertEqual("SEARCH");
      expect(objNew.getElement('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchFontColor07
     * @tc.name testSearchFontColor_static_07
     * @tc.desc set the FontColor property value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchFontColor_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchFontColor07';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 7,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2001,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('fontColor')).assertEqual("#FFFF0000");
      expect(objNew.getElement('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchCopyOption08
     * @tc.name testSearchCopyOption_static_08
     * @tc.desc set the CopyOption property value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchCopyOption_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCopyOption08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getElement('copyOption')).assertEqual("CopyOptions.Local");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 8,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2101,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('copyOption')).assertEqual("CopyOptions.InApp");
      expect(objNew.getElement('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchTextFont09
     * @tc.name testSearchTextFont_static_09
     * @tc.desc set the TextFont property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchTextFont_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchTextFont09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getElement('textFont'))
        .assertEqual('{"fontSize":"' + uiContext.px2fp(resourceSize) +
          '.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 9,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2201,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('textFont'))
        .assertEqual("{\"fontSize\":\"16.00fp\",\"fontStyle\":\"FontStyle.Normal\",\"fontWeight\":\"FontWeight.Normal\",\"fontFamily\":\"Arial, HarmonyOS Sans\"}");
      expect(objNew.getElement('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchPlaceholderColor10
     * @tc.name testSearchPlaceholderColor_static_10
     * @tc.desc set the PlaceholderColor property value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchPlaceholderColor_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchPlaceholderColor10';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 10,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2301,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('placeholderColor')).assertEqual("#FFFF0000");
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchCancelButton11
     * @tc.name testSearchCancelButton_static_11
     * @tc.desc set the CancelButton property value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchCancelButton_static_11', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchCancelButton11';
      console.info('[' + tagName + '] START============================');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 11,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2401,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      const uiContext = new UIContext();
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(JSON.stringify(objNew.getElement('$attrs').getString('cancelButton')))
        .assertEqual(`{\"style\":\"CancelButtonStyle.CONSTANT\",\"icon\":{\"size\":\"${uiContext.vp2px(10)
          .toFixed(2)}px\",\"color\":\"#FF000000\",\"src\":\"resource:///ohos_close.svg\"}}`);
      expect(objNew.getString('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testSearchTextAlign12
     * @tc.name testSearchTextAlign_static_12
     * @tc.desc set the TextAlign property value is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSearchTextAlign_static_12', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testSearchTextAlign12';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('search');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('Search');
      expect(obj.getElement('$attrs').getElement('textAlign')).assertEqual("TextAlign.Start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": 12,
          } as Record<String, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2501,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getElement('textAlign')).assertEqual("TextAlign.Center");
      expect(objNew.getElement('$type')).assertEqual('Search');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
