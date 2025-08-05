// /**
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
//
// import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
// import router from '@ohos.router';
// import events_emitter from '@ohos.events.emitter'
// import Utils from './Utils';
// import inspector from '@ohos.arkui.inspector'
// import { FontStyle, FontWeight, TextCase, TextDecorationType, Color } from '@ohos.arkui.component'
// import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
//
// export default function spanTest() {
//   describe('spanTest', (): void => {
//     // beforeEach(async (): Promise<void> => {
//     //   console.info("span beforeEach start");
//     //   let options: router.RouterOptions = {
//     //     url: 'MainAbility/pages/span/spanPage',
//     //   }
//     //   try {
//     //     router.clear();
//     //     let pages = router.getState();
//     //     console.info("get span state pages: " + String(pages));
//     //     if (!("spanPage" == pages.name)) {
//     //       console.info("get span pages.name: " + String(pages.name));
//     //       await router.pushUrl(options);
//     //       await Utils.sleep(2000);
//     //       console.info("push span page result success");
//     //     }
//     //   } catch (err: Error) {
//     //     console.error("push span page error: " + err);
//     //   }
//     //   done()
//     // });
//     afterEach(async (): Promise<void> => {
//       await Utils.sleep(1000);
//       console.info("span after each called");
//     })
//
//     /**
//      * @tc.number testSpanFontSize_static01
//      * @tc.name   testSpanFontSize_static_01
//      * @tc.desc   set the fontSize property value is 68/resources50
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanFontSize_static_01', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanFontSize_static01';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // let obj = JSON.parse<Object>(strJson, Type.of(new Object()));
//       // expect(obj?.$type).assertEqual('Span');
//       // expect(obj?.$attrs.fontSize).assertEqual("16.00fp");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mFontSize": 68,
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6801,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.fontSize).assertEqual("68.00fp");
//
//       try {
//         let eventData2: events_emitter.EventData = {
//           data: {
//             "mFontSize": 'resources50',
//           } as Record<String,Object>
//         }
//         let innerEvent2: events_emitter.InnerEvent = {
//           eventId: 6802,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent2, eventData2);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew2 = inspector.getInspectorByKey('keykeyspan');
//       // let objNew2: ESObject = JSON.parse(strJsonNew2);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// String(objNew));
//       //
//       // expect(objNew2.$attrs.fontSize).assertEqual("50.00vp");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanfontFamily02
//      * @tc.name   testSpanfontFamily_static_02
//      * @tc.desc   set the fontFamily property value is Arial
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanfontFamily_static_02', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanfontFamily02';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.fontFamily).assertEqual("HarmonyOS Sans");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mFontFamily": 'Arial',
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6803,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.fontFamily).assertEqual("Arial");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//      /**getUIContext
//      * @tc.number testSpanlineHeight03
//      * @tc.name   testSpanlineHeight_static_03
//      * @tc.desc   set the lineHeight property value is 80fp/50
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanlineHeight_static_03', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanlineHeight03';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.lineHeight).assertEqual("0.00fp");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mLineHeight": '80fp',
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6804,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.lineHeight).assertEqual("80.00fp");
//
//       try {
//         let eventData2: events_emitter.EventData = {
//           data: {
//             "mLineHeight": 50,
//           } as Record<String,Object>
//         }
//         let innerEvent2: events_emitter.InnerEvent = {
//           eventId: 6805,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent2, eventData2);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew2 = inspector.getInspectorByKey('keykeyspan');
//       // let objNew2: ESObject = JSON.parse(strJsonNew2);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);// String(objNew));
//       //
//       // expect(objNew2.$attrs.lineHeight).assertEqual("50.00fp");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanfontStyle04
//      * @tc.name   testSpanfontStyle_static_04
//      * @tc.desc   set the fontStyle property value is FontStyle.Normal/FontStyle.Italic
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanfontStyle_static_04', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanfontStyle04';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Normal");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mFontStyle": FontStyle.Italic,
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6806,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Italic");
//
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanfontWeight05
//      * @tc.name   testSpanfontWeight_static_05
//      * @tc.desc   set the fontWeight property value is 400/FontWeight.Bold
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanfontWeight_static_05', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanfontWeight05';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       // console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.fontWeight).assertEqual("400");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mFontWeight": FontWeight.Bold,
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6807,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.fontWeight).assertEqual("FontWeight.Bold");
//
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpantextCase06
//      * @tc.name   testSpantextCase_static_06
//      * @tc.desc   set the textCase property value is TextCase.Normal/TextCase.UpperCase
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpantextCase_static_06', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpantextCase06';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.textCase).assertEqual("TextCase.Normal");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mTextCase": TextCase.UpperCase,
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6808,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.textCase).assertEqual("TextCase.UpperCase");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpandecoration07
//      * @tc.name   testSpandecoration_static_07
//      * @tc.desc   set the decoration property value is TextDecorationType.Underline Color.Red
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpandecoration_static_07', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpandecoration07';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.decoration).assertEqual('{"type":"TextDecorationType.None","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mDecorationType": TextDecorationType.Underline,
//             "mDecorationColor" : Color.Red
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6809,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.decoration).assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanfontColor08
//      * @tc.name   testSpanfontColor_static_08
//      * @tc.desc   set the fontColor property value is #FF000000/0xFF00FF
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanfontColor_static_08', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanfontColor08';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.fontColor).assertEqual("#FF000000");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mFontColor": 0xFF00FF
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6810,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.fontColor).assertEqual("#FFFF00FF");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanletterSpacing09
//      * @tc.name   testSpanletterSpacing_static_09
//      * @tc.desc   set the letterSpacing property value is 0.00fp/5
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanletterSpacing_static_09', 0, async (done: () => void): Promise<void> => {
//       let tagName = 'testSpanletterSpacing09';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(obj.$attrs.letterSpacing).assertEqual("0.00fp");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "mLetterSpacing": 5
//           } as Record<String,Object>
//         }
//         let innerEvent : events_emitter.InnerEvent= {
//           eventId: 6811,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan');
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       //
//       // expect(objNew.$attrs.letterSpacing).assertEqual("5.00fp");
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//
//     /**
//      * @tc.number testSpanFont10
//      * @tc.name   testSpanFont_static_10
//      * @tc.desc   set the font property value is obj
//      * @tc.size   MediumTest
//      * @tc.type   Function
//      * @tc.level  0
//      */
//     it('testSpanFont_static_10', 0, async (done: () => void): Promise<void> => {
//       const resourceSize = AppStorage.get<Number>("resourceSize") as Number
//       let tagName = 'testSpanFont10';
//       console.info('[' + tagName + '] START============================');
//       await Utils.sleep(1000)
//       let strJson = inspector.getInspectorByKey('keykeyspan2');
//       console.info('[' + tagName + '] component obj is: ' + strJson);
//       // let obj = JSON.parseJsonElement(strJson);
//       // expect(obj.$type).assertEqual('Span');
//       // expect(JSON.parse(obj.$attrs.font).style).assertEqual("FontStyle.Normal");
//       // expect(JSON.parse(obj.$attrs.font).size).assertEqual(px2fp(resourceSize)+'.00fp');
//       // expect(JSON.parse(obj.$attrs.font).weight).assertEqual("FontWeight.Normal");
//       // expect(JSON.parse(obj.$attrs.font).family).assertEqual("HarmonyOS Sans");
//
//       try {
//         let eventData: events_emitter.EventData = {
//           data: {
//             "numFont": 3
//           } as Record<String,Object>
//         }
//         let innerEvent: events_emitter.InnerEvent = {
//           eventId: 6812,
//           priority: events_emitter.EventPriority.LOW
//         }
//         console.info('[' + tagName + '] start to publish emit');
//         events_emitter.emit(innerEvent, eventData);
//       } catch (err: Error) {
//         console.log('[' + tagName + '] change component data error: ' + err.message);
//       }
//       await Utils.sleep(2000);
//       let strJsonNew = inspector.getInspectorByKey('keykeyspan2');
//       console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// String(objNew));
//       // let objNew: ESObject = JSON.parse(strJsonNew);
//       // expect(objNew.$attrs.font).assertEqual('{"style":"FontStyle.Italic","size":"50.00vp","weight":"FontWeight.Bold","family":"Arial"}');
//
//       console.info('[' + tagName + '] END ===========================');
//       done();
//     });
//   })
// }
