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
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextAPI23() {

  describe('GraphicTextAPI23', () => {
    let myColor: common2D.Color;
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0100
     * @tc.number testLoadFontSyncWithCheckStatic_0100
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 0);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (err: BusinessError) {
          console.error(`www data Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(err)}`);
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0200
     * @tc.number testLoadFontSyncWithCheckStatic_0200
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900001).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0300
     * @tc.number testLoadFontSyncWithCheckStatic_0300
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900008).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0400
     * @tc.number testLoadFontSyncWithCheckStatic_0400
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0500
     * @tc.number testLoadFontSyncWithCheckStatic_0500
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0600
     * @tc.number testLoadFontSyncWithCheckStatic_0600
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900002).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0700
     * @tc.number testLoadFontSyncWithCheckStatic_0700
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0800
     * @tc.number testLoadFontSyncWithCheckStatic_0800
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900008).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0100
     * @tc.number testLoadFontWithCheckStatic_0100
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 0)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0200
     * @tc.number testLoadFontWithCheckStatic_0200
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900001).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0300
     * @tc.number testLoadFontWithCheckStatic_0300
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900008).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0400
     * @tc.number testLoadFontWithCheckStatic_0400
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0500
     * @tc.number testLoadFontWithCheckStatic_0500
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0600
     * @tc.number testLoadFontWithCheckStatic_0600
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900002).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0700
     * @tc.number testLoadFontWithCheckStatic_0700
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0800
     * @tc.number testLoadFontWithCheckStatic_0800
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900008).assertTrue();
          });
        done();
      })



  })
}
