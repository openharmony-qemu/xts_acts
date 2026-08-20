/**
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetCharacterPositionAtCoordinateTest() {
  describe('GetCharacterPositionAtCoordinateTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GetCharacterPositionAtCoordinateTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextLayoutManagerApi26',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('get TextLayoutManagerApi26 state pages: ' + JSON.stringify(pages));
        if (!pages.name.includes('TextLayoutManagerApi26')) {
          const result = await router.replaceUrl(options);
          console.info('push TextLayoutManagerApi26 page success: ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push TextLayoutManagerApi26 page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      AppStorage.delete('charPos_utf8');
      AppStorage.delete('charPos_utf16');
      AppStorage.delete('charPos_default');
      AppStorage.delete('charPos_zero');
      AppStorage.delete('charPos_negative');
      AppStorage.delete('charPos_large');
      AppStorage.delete('charPos_utf16_result');
      await CommonFunc.sleep(500);
      console.info('GetCharacterPositionAtCoordinateTest afterEach called');
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0010
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF8_0010
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF8 encoding returns valid PositionWithAffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0010] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('charPos_utf8');
        console.info('[GetCharacterPositionAtCoordinateTest_0010] result: ' + result);
        expect(result).assertContain('position:');
        expect(result).assertContain('affinity:');
        expect(result !== 'undefined').assertTrue();

        const parts: string[] = result!.split(',');
        const positionStr: string = parts[0].split(':')[1];
        const position: number = parseInt(positionStr, 10);
        expect(position >= 0 && position <= 11).assertTrue();
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0010 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0010] END');
      done();
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0020
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF16_0020
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF16 encoding returns valid PositionWithAffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0020] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('charPos_utf16');
        console.info('[GetCharacterPositionAtCoordinateTest_0020] result: ' + result);
        expect(result).assertContain('position:');
        expect(result).assertContain('affinity:');
        expect(result !== 'undefined').assertTrue();

        const parts: string[] = result!.split(',');
        const positionStr: string = parts[0].split(':')[1];
        const position: number = parseInt(positionStr, 10);
        expect(position >= 0 && position <= 7).assertTrue();
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0020 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0020] END');
      done();
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0030
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_DEFAULT_0030
     * @tc.desc   Test getCharacterPositionAtCoordinate with undefined encoding (default UTF8)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0030] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const resultDefault: string | undefined = AppStorage.get<string>('charPos_default');
        const resultUtf8: string | undefined = AppStorage.get<string>('charPos_utf8');
        console.info('[GetCharacterPositionAtCoordinateTest_0030] default: ' + resultDefault + ', utf8: ' + resultUtf8);
        expect(resultDefault).assertContain('position:');
        expect(resultDefault !== 'undefined').assertTrue();
        expect(resultDefault).assertEqual(resultUtf8);
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0030 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0030] END');
      done();
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0040
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_ZERO_0040
     * @tc.desc   Test getCharacterPositionAtCoordinate with boundary coordinate (0, 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0040] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('charPos_zero');
        console.info('[GetCharacterPositionAtCoordinateTest_0040] result: ' + result);
        expect(result).assertContain('position:');
        expect(result).assertContain('affinity:');
        expect(result !== 'undefined').assertTrue();

        const parts: string[] = result!.split(',');
        const positionStr: string = parts[0].split(':')[1];
        const position: number = parseInt(positionStr, 10);
        expect(position >= 0).assertTrue();
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0040 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0040] END');
      done();
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0050
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_NEGATIVE_0050
     * @tc.desc   Test getCharacterPositionAtCoordinate with negative coordinates does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0050] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('charPos_negative');
        console.info('[GetCharacterPositionAtCoordinateTest_0050] result: ' + result);
        expect(result).assertContain('position:');
        expect(result).assertContain('affinity:');
        expect(result !== 'undefined').assertTrue();

        const parts: string[] = result!.split(',');
        const positionStr: string = parts[0].split(':')[1];
        const position: number = parseInt(positionStr, 10);
        expect(position >= 0).assertTrue();
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0050 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0050] END');
      done();
    });

    /**
     * @tc.name   GetCharacterPositionAtCoordinateTest_0060
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITION_LARGE_0060
     * @tc.desc   Test getCharacterPositionAtCoordinate with large coordinates beyond text bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterPositionAtCoordinateTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterPositionAtCoordinateTest_0060] START');
      try{
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_char_pos_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('charPos_large');
        console.info('[GetCharacterPositionAtCoordinateTest_0060] result: ' + result);
        expect(result).assertContain('position:');
        expect(result).assertContain('affinity:');
        expect(result !== 'undefined').assertTrue();

        const parts: string[] = result!.split(',');
        const positionStr: string = parts[0].split(':')[1];
        const position: number = parseInt(positionStr, 10);
        expect(position >= 0 && position <= 11).assertTrue();
      }catch (err) {
        console.error('GetCharacterPositionAtCoordinateTest_0060 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetCharacterPositionAtCoordinateTest_0060] END');
      done();
    });
  });
}
