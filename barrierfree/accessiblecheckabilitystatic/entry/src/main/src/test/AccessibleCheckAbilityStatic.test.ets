/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import Rect from '@ohos.application.AccessibilityExtensionAbility';
import accessibility from '@ohos.accessibility'
import { Resource } from 'global.resource';

class Rect {
  	left: number;
  	top: number;
  	width: number;
  	height: number;
}




type CaptionsFontFamily = 'default' | 'monospacedSerif' | 'serif' | 'monospacedSansSerif' | 'sansSerif' | 'casual' | 'cursive' | 'smallCapitals';
type CaptionsFontEdgeType = 'none' | 'raised' | 'depressed' | 'uniform' | 'dropShadow';

let result: boolean = false;
let domain: int = 0x0000;
let tag: string = 'testTag';
const bundleName = 'com.huawei.hmos.cardistributedassist';
const triggerAction : accessibility.Action = 'accessibilityFocus';
const eventType : accessibility.EventType = 'accessibilityFocus';

export default function abilityTest() {
  describe("AccessibleCheckAbilityStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.desc    The result of isOpenAccessibilitySync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500');
      try {
        let status = accessibility.isOpenAccessibilitySync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 failed to isOpenAccessibilitySync because ');
        expect(null).assertFail();
        done();
      }
    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.desc    The result of isOpenTouchGuideSync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600');
      try {
        let status = accessibility.isOpenTouchGuideSync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 failed to isOpenTouchGuideSync because ');
        expect(null).assertFail();
        done();
      }
    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400
      * @tc.name    SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400
      * @tc.desc    The result of isScreenReaderOpenSync() should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400');
      try {
        let status = accessibility.isScreenReaderOpenSync();
        console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400 result: ${status}`);
        expect(status).assertEqual(false);
        done();
      } catch (exception) {
        console.error('SUB_BASIC_BARRIERFREE_API_isScreenReaderOpenSync_0400 failed to AccessibilityExtensionListSync because ' + JSON.stringify(exception));
        done();
      }
    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500 start');
      let abilityState = 'install';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => { 
        console.info(`SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0600
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0600 start');
      let abilityState = 'disable';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => { 
        console.info(`SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0600 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_0500 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });

    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000
      * @tc.name    SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000 start');
      let abilityState = 'install';
      let abilityType = 'all';

      accessibility.getAccessibilityExtensionList(abilityType, abilityState, (err: BusinessError | null, data: accessibility.AccessibilityAbilityInfo[] | undefined) => { 
        if (err?.code) {
          console.log(`SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000 failed to get accessibility extension list, Code is ${err?.code}, message is ${err?.message}`);
          done();
        }
        console.log(`SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_2000 Succeeded in get accessibility extension list.` + JSON.stringify(data));
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });

      })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_Rect_3500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_Rect_3500
      * @tc.desc    The result of Rect should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_Rect_3500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_Rect_3500');
      try{
        let rect: Rect = new Rect();
        rect.left = 338;
        rect.top = 470;
        rect.width = 585;
        rect.height = 130;
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_Rect_3500 rect Succeeded`);
        result = true
      } catch (error) {
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_Rect_3500 rect false`);
        result = false
      }
      expect(result).assertEqual(true);
      done();

    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600
    * @tc.desc    The parameters input are all and 'install', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600');
      try {
          let abilityState = 'install';
          let abilityType = 'all';
          let list = accessibility.getAccessibilityExtensionListSync(abilityType, abilityState);
          console.info(`AccessibilityExtensionListSync: SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600 result: ${list}`);
          expect(Array.isArray(list)).assertEqual(true);
          done();
      } catch (exception) {
          console.error('SUB_BASIC_BARRIERFREE_API_getAccessibilityExtensionList_static_3600 failed to AccessibilityExtensionListSync because ' + JSON.stringify(exception));
          expect(null).assertFail();
          done();
      }
    })

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700
      * @tc.name    SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700
      * @tc.desc    The result of CaptionsStyle should be boolean type.
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700');
      try{
        let captionsStyle: accessibility.CaptionsStyle = {"fontFamily":"default","fontScale":0,"fontColor":"#000000ff","fontEdgeType":"none","backgroundColor":"#000000ff","windowColor":"#000000ff"};
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700 CaptionsStyle Succeeded`);
        result = true
      } catch (error) {
        console.info(`Rect: SUB_BASIC_BARRIERFREE_API_CaptionsStyle_static_3700 CaptionsStyle false`);
        result = false
      }
      expect(result).assertEqual(true);
      done();

    })


    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800
      * @tc.desc    The parameters input are all and 'enable', test the getAbilityLists() function,
      *             and the output is the list of AccessibilityAbilityInfo
      * @tc.size    SmallTest
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800 start');
      let abilityState = 'install';
      let abilityType = 'all';
      accessibility.getAccessibilityExtensionList(abilityType, abilityState).then((data: accessibility.AccessibilityAbilityInfo[]) => { 
        console.info(`SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800 Successded in get accessibility extension list: ${JSON.stringify(data)}`);
        expect(typeof data[0].id === 'string').assertEqual(true);
        expect(typeof data[0].name === 'string').assertEqual(true);
        expect(typeof data[0].bundleName === 'string').assertEqual(true);
        expect(Array.isArray(data[0].targetBundleNames)).assertEqual(true);
        expect(Array.isArray(data[0].abilityTypes)).assertEqual(true);
        expect(Array.isArray(data[0].capabilities)).assertEqual(true);
        expect(typeof data[0].description === 'string').assertEqual(true);
        expect(Array.isArray(data[0].eventTypes)).assertEqual(true);
        expect(typeof data[0].needHide === 'boolean').assertEqual(true);
        expect(typeof data[0].label === 'string').assertEqual(true);
        done();
      }).catch((err: Error) => {
        console.log('getAccessibilityExtensionList_promise error.');
        console.error('SUB_BASIC_BARRIERFREE_API_AccessibilityAbilityInfo_static_3800 failed to AccessibilityExtensionListSync because ' + JSON.stringify(err));
        done();
      });


    })


    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900');
      let pageId = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.pageId = pageId;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_3900 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000');
      let beginIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.beginIndex = beginIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100');
      let currentIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.currentIndex = currentIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4100 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200');
      let endIndex = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.endIndex = endIndex;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 0
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300');
      let itemCount = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.itemCount = itemCount;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4400
    * @tc.desc    The typy of EventInfo is announceForAccessibilityNotInterrupt, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendAccessibilityEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4400');
      let elementId = 1;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'click'
      event.elementId = elementId;

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4300 has error`);
        expect(null).assertFail();
        done();
      };

    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500
    * @tc.desc    The typy of EventInfo is announceForAccessibilityNotInterrupt, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendAccessibilityEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500');
      let resource: Resource = {"bundleName":"com.huawei.hmos.cardistributedassist","moduleName":"description","id":1};

      let textResourceAnnouncedForAccessibility = resource;

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'common'
      event.textResourceAnnouncedForAccessibility = textResourceAnnouncedForAccessibility;
      
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `EventInfo: SUB_BASIC_BARRIERFREE_API_EventInfo_static_4500 has error`);
        expect(null).assertFail();
        done();
      };

    })








  })
}