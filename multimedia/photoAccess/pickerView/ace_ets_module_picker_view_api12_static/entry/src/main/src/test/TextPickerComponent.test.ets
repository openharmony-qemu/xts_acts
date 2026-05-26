/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level } from '../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import { EventType } from '../../ets/MainAbility/common/Common';
import { Component, Driver, ON, MatchPattern } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import {
  PhotoPickerComponent,
  PickerController,
  PickerOptions,
  DataType,
  PickerColorMode,
  MaxSelected,
  MaxCountType,
  ItemInfo,
  ReminderMode,
  SelectMode,
  PickerOrientation,
  PhotoBrowserInfo,
  ClickType,
  BaseItemInfo,
  SaveMode,
  ItemDisplayRatio,
  AnimatorParams
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { PhotoPickerResult } from '../../ets/MainAbility/common/PhotoPickerResult'
import {
  RecentPhotoOptions,
  PhotoSource,
} from '@ohos.file.RecentPhotoComponent';
import { fileUri } from '@kit.CoreFileKit';
import inspector from '@ohos.arkui.inspector'
import Context from 'application.Context';
import { canIUse } from '@internal.full.global'
import { BusinessError } from '@kit.BasicServicesKit';
import { RouterOptionsParams, RouterRecentPhotoOptions } from '../../ets/MainAbility/common/Common'
import { RecordData } from '@ohos.base'

const TAG: string = 'TestPickerTest: '

export default function TextPicker(): void {
  describe('testPicker', (): void => {
    console.info(TAG + 'describe start');
    const isExecutePicker = canIUse('SystemCapability.FileManagement.PhotoAccessHelper.Core');
    const SEEK_START = 3;
    const SEEK_FINISH = 4;

    let routerInstance: Router;
    let appContext: Context;
    let driver: Driver;

    routerInstance = AppStorage.get<Router>('router') as Router;
    appContext = AppStorage.get<Context>('Context') as Context;
    driver = Driver.create();

    let routeToUrl = async (options: router.RouterOptions): Promise<void> => {
      console.info(TAG + 'routeToUrl enter, options.url: ' + options.url);
      try {
        routerInstance = AppStorage.get<Router>('router') as Router;
        if (routerInstance == undefined) {
          console.error(TAG + 'routerInstance is undefined');
          return;
        }
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info(TAG + 'testPicker state pages:' + JSON.stringify(pages));
        if (!('PickerComponent' == pages.name)) {
          console.info(TAG + 'testPicker state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.msSleep(2000);
        }
      } catch (err) {
        console.error(TAG + 'testPicker page error:' + err);
      }
    }

    let getDefaultPickerOptions = (): PickerOptions => {
      console.info(TAG + 'getDefaultPickerOptions enter');
      let pickerOptions: PickerOptions = new PickerOptions();
      pickerOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      pickerOptions.isSearchSupported = false;
      pickerOptions.isPhotoTakingSupported = false;
      pickerOptions.isRepeatSelectSupported = false;
      pickerOptions.maxSelectNumber = 500;
      pickerOptions.maxSelectedReminderMode = ReminderMode.TOAST;
      pickerOptions.maxPhotoSelectNumber = 500;
      pickerOptions.maxVideoSelectNumber = 500;
      pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.AUTO;
      pickerOptions.orientation = PickerOrientation.HORIZONTAL;
      pickerOptions.uiComponentColorMode = PickerColorMode.AUTO;
      return pickerOptions;
    }

    let getDefaultPhotoSelectOptions = (): photoAccessHelper.PhotoSelectOptions => {
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      photoSelectOptions.isEditSupported = false;
      photoSelectOptions.isOriginalSupported = false;
      photoSelectOptions.subWindowName = '';
      photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_DONE;
      photoSelectOptions.userId = 500;
      return photoSelectOptions;
    }

    let clickResultButton = async (driver: Driver): Promise<void> => {
      console.info('clickResultButton enter');
      let btn = await driver.findComponent(ON.id('resultButton'));
      console.info('testPicker findComponent resultButton succsess');
      if (btn === null) {
        console.info('no button');
        return;
      }
      await btn.click();
      console.info('testPicker btn click finish');
      await Utils.msSleep(1000);
    }

    let clickPreviewButton = async (driver: Driver): Promise<void> => {
      console.info('clickPreviewButton enter');
      let btn = await driver.findComponent(ON.id('previewButton'));
      if (btn === null) {
        console.info('no button');
        return;
      }
      console.info('testPicker findComponent previewButton succsess');
      await btn.click();
      console.info('testPicker clickPreviewButton click finish');
      await Utils.msSleep(1000);
    }

    let clickPhotoPickerComponent = async (driver: Driver): Promise<void> => {
      console.info('clickPhotoPickerComponent enter');
      let btn = await driver.findComponent(ON.id('PhotoPickerComponent'));
      if (btn === null) {
        console.info('no button');
        return;
      }
      console.info('testPicker findComponent PhotoPickerComponent succsess');
      await btn.click();
      console.info('testPicker clickPhotoPickerComponent click finish');
      await Utils.msSleep(1000);
    }

    let clickExitBrowser = async (driver: Driver): Promise<void> => {
      console.info('clickExitBrowser enter');
      let btn = await driver.findComponent(ON.id('exitBrowser'))
      if (btn === null) {
        console.info('no button');
        return;
      };
      console.info('testPicker findComponent exitBrowser succsess');
      await btn.click();
      console.info('testPicker clickExitBrowser click finish');
      await Utils.msSleep(1000);
    }

    let clickSetDataButton = async (driver: Driver): Promise<void> => {
      console.info('clickSetDataButton enter');
      let btn = await driver.findComponent(ON.id('setDataButton'))
      if (btn === null) {
        console.info('no button');
        return;
      };
      console.info('testPicker findComponent setDataButton succsess');
      await btn.click();
      console.info('testPicker clickSetDataButton click finish');
      await Utils.msSleep(1000);
    }

    let clickAlbumButton = async (driver: Driver): Promise<void> => {
      console.info('clickAlbumButton enter');
      let btn = await driver.findComponent(ON.id('albumButton'));
      if (btn === null) {
        console.info('no button');
        return;
      }
      await btn.click();
      console.info('testPicker btn click finish');
      await Utils.msSleep(1000);
      let btnEmptyArea = await driver.findComponent(ON.id('AlbumPickerComponent'));
      if (btnEmptyArea === null) {
        console.info('no button');
        return;
      }
      await btnEmptyArea.click();
      console.info('testPicker btnEmptyArea click finish');
      await Utils.msSleep(1000);
      let albumItemDefault = await driver.findComponent((ON.id('ListItem_0')));
      if (albumItemDefault === null) {
        console.info('no ListItem');
        return;
      }
      console.info('testPicker findComponent ListItem_0 success');
      await albumItemDefault.click();
    }

    let clickBigPicture = async (driver: Driver): Promise<void> => {
      console.info('clickBigPicture enter');
      let btn = await driver.findComponent(ON.type('Image'));
      if (btn === null) {
        console.info('no Image');
        return;
      }
      await btn.click();
      console.info('testPicker btn click finish');
      await Utils.msSleep(1000);
    }

    let testCompleteButton = async (driver: Driver, textMode: int): Promise<boolean> => {
      let buttonText: string = '';
      switch (textMode) {
        case 0:
          buttonText = 'TEXT_DONE';
          break;
        case 1:
          buttonText = 'TEXT_SEND';
          break;
        case 2:
          buttonText = 'TEXT_ADD';
          break;
        default:
          buttonText = 'TEXT_DONE';
          break;
      }
      let chooostModeButton: Component | null = await driver.findComponent(ON.id(buttonText));
      if (chooostModeButton !== null) {
        await chooostModeButton.click();
      } else {
        console.error('can not find button');
        expect().assertFail();
        return false;
      }
      let button: Component | null = await driver.findComponent(ON.id('select photo'));
      expect(button !== null).assertTrue();
      if (button !== null) {
        await button.click();
      } else {
        console.error('can not find button');
        expect().assertFail();
        return false;
      }
      await Utils.msSleep(3000);
      await driver.pressBack();
      return true;
    }

    let clickAgreeSave = async (driver: Driver): Promise<void> => {
      console.info('clickAgreeSave enter');
      let btn = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 5000);
      if (btn === null) {
        console.info('no Agree button');
        return;
      }
      await btn.click();
      console.info('clickAgreeSave btn click finish');
    }

    beforeAll(async () => {
      console.info(TAG + 'beforeAll start');
      routerInstance = AppStorage.get<Router>('router') as Router;
      appContext = AppStorage.get<Context>('Context') as Context;
      driver = Driver.create();
      let maxButton = await driver.findComponent(ON.id('EnhanceMaximizeBtn'));
      let isExecuteTestCase: boolean = false;
      await Utils.msSleep(1000);
      if (maxButton !== null) {
        await maxButton.click();
        isExecuteTestCase = true;
      }
      await Utils.msSleep(1000);
      if (!isExecuteTestCase) {
        try {
          driver.triggerCombineKeys(17, 18);
        } catch (error) {
          console.error(`cannot screenshot, error is: ${JSON.stringify(error)}`);
        }
      }
    });

    beforeEach(async () => {
      console.info(TAG + 'beforeEach start');
      await Utils.msSleep(2000);
    });

    afterEach(async () => {
      console.info(TAG + 'afterEach start');
      await Utils.msSleep(1000);
    });

    /**
     * @tc.number   testPicker_static_14
     * @tc.name     testPicker_static_14
     * @tc.desc     Testing ItemInfo's all properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_14', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.SELECT_ITEM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        let result: ItemInfo | null = (data['msg'] as ItemInfo) ?? null;
        console.info('testPicker_static_14 select ItemInfo=:' + JSON.stringify(result));
        expect(result?.itemType).not().assertUndefined();
        expect(result?.uri).not().assertUndefined();
        expect(result?.mimeType).not().assertUndefined();
        expect(result?.width).not().assertUndefined();
        expect(result?.height).not().assertUndefined();
        expect(result?.size).not().assertUndefined();
        expect(result?.duration).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_14 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await Utils.msSleep(2000);
      await clickPhotoPickerComponent(driver);
      await Utils.msSleep(2000);
      let checkBoxs: Array<Component> | null = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info('testPicker_static_14 findComponent checkbox fail');
      } else {
        console.info('testPicker_static_14 findComponent checkbox success');
        await checkBoxs[0]!.click();
        await Utils.msSleep(2000);
        console.info('testPicker_static_14 btn click finish');
      }
      routerInstance.back();
      console.info('testPicker_static_14 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_15
     * @tc.name     testPicker_static_15
     * @tc.desc     Testing MaxSelected
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_15', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.SELECT_ITEM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let selectCount: int = 0;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        let result: ItemInfo | null = (data['msg'] as ItemInfo) ?? null;
        selectCount++;
        console.info('testPicker_static_15 select ItemInfo=:' + JSON.stringify(result));
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      await Utils.msSleep(2000);

      let changeNumButton: Component | null = await driver.findComponent(ON.id('changeNumButton'));

      if (changeNumButton === null) {
        console.info('testPicker_static_15 findComponent changeNumButton fail');
        expect().assertFail();
      } else {
        console.info('testPicker_static_15 findComponent changeNumButton success');
        await changeNumButton.click();
      }
      await Utils.msSleep(2000);
      await clickPhotoPickerComponent(driver);
      await Utils.msSleep(2000);
      let checkBoxs: Array<Component> | null = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info('testPicker_static_15 findComponent checkbox fail');
      } else {
        console.info('testPicker_static_15 findComponent checkbox success');
        let selectNum = Math.min(checkBoxs!.length, 3);
        for (let index = 0; index < selectNum; index++) {
          await checkBoxs[index]!.click();
        }
        await Utils.msSleep(1000);
        expect(selectCount).assertLessOrEqual(1);

        await clickPreviewButton(driver);
        await Utils.msSleep(2000);
        await clickExitBrowser(driver);
        await Utils.msSleep(2000);
        await clickSetDataButton(driver);
        await Utils.msSleep(2000);
        console.info('testPicker_static_15 btn click finish');
      }
      routerInstance.back();
      console.info('testPicker_static_15 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_01
     * @tc.name     testPicker_static_01
     * @tc.desc     Testing route to PhotoPickerComponent
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.checkBoxColor = '#000000';
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        let expectResult: String = pickerOptions.checkBoxColor ?? '';
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let result: string = message?.checkBoxColor ?? '';
        console.info('testPicker_static_01 result event.data.msg=:' + result);
        console.info('testPicker_static_01 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_01 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      events_emitter.off(event.eventId);
      console.info('testPicker_static_01 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_02
     * @tc.name     testPicker_static_02
     * @tc.desc     Testing Change PhotoPickerComponent BackgroundColor
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.backgroundColor = '#000000';
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: String = pickerOptions.backgroundColor ?? '';
        const result: string = message?.backgroundColor ?? '';
        console.info('testPicker_static_02 result event.data.msg=:' + result);
        console.info('testPicker_static_02 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_02 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_02 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_03
     * @tc.name     testPicker_static_03
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's isRepeatSelectSupported property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.isRepeatSelectSupported = true;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: boolean = pickerOptions.isRepeatSelectSupported ?? false;
        const result: boolean = message?.isRepeatSelectSupported ?? false;
        console.info('testPicker_static_03 result event.data.msg=:' + result);
        console.info('testPicker_static_03 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_03 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_03 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_04
     * @tc.name     testPicker_static_04
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's checkboxTextColor property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.checkboxTextColor = '#000000';

      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: String = pickerOptions.checkboxTextColor ?? '';
        const result: string = message?.checkboxTextColor ?? '';
        console.info('testPicker_static_04 result event.data.msg=:' + result);
        console.info('testPicker_static_04 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_04 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_04 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_05
     * @tc.name      testPicker_static_05
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPicker_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.LIGHT;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.photoBrowserBackgroundColorMode ?? PickerColorMode.AUTO;
        const result: int = message?.photoBrowserBackgroundColorMode ?? 0;
        console.info('testPicker_static_05 result event.data.msg=:' + result);
        console.info('testPicker_static_05 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_05 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_05 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_06
     * @tc.name      testPicker_static_06
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPicker_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.DARK;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.photoBrowserBackgroundColorMode ?? PickerColorMode.AUTO;
        const result: int = message?.photoBrowserBackgroundColorMode ?? 0;
        console.info('testPicker_static_06 result event.data.msg=:' + result);
        console.info('testPicker_static_06 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_06 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_06 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_07
     * @tc.name      testPicker_static_07
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('testPicker_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectedReminderMode = ReminderMode.NONE;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.maxSelectedReminderMode ?? ReminderMode.TOAST;
        const result: int = message?.maxSelectedReminderMode ?? 0;
        console.info('testPicker_static_07 result event.data.msg=:' + result);
        console.info('testPicker_static_07 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_07 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_07 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_08
     * @tc.name      testPicker_static_08
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('testPicker_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectedReminderMode = ReminderMode.MASK;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.maxSelectedReminderMode ?? ReminderMode.TOAST;
        const result: int = message?.maxSelectedReminderMode ?? 0;
        console.info('testPicker_static_08 result event.data.msg=:' + result);
        console.info('testPicker_static_08 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_08 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_08 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_09
     * @tc.name      testPicker_static_09
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's selectMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('testPicker_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.selectMode = SelectMode.SINGLE_SELECT;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.selectMode ?? SelectMode.MULTI_SELECT;
        const result: int = message?.selectMode ?? 0;
        console.info('testPicker_static_09 result event.data.msg=:' + result);
        console.info('testPicker_static_09 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_09 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_09 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_10
     * @tc.name      testPicker_static_10
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxPhotoSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPicker_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxPhotoSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.maxPhotoSelectNumber ?? 500;
        const result: int = message?.maxPhotoSelectNumber ?? 500;
        console.info('testPicker_static_10 result event.data.msg=:' + result);
        console.info('testPicker_static_10 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_10 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_10 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_11
     * @tc.name      testPicker_static_11
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxVideoSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPicker_static_11', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxVideoSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.maxVideoSelectNumber ?? 500;
        const result: int = message?.maxVideoSelectNumber ?? 500;
        console.info('testPicker_static_11 result event.data.msg=:' + result);
        console.info('testPicker_static_11 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_11 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_11 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    testPicker_static_12
     * @tc.name      testPicker_static_12
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPicker_static_12', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = pickerOptions.maxSelectNumber ?? 500;
        const result: int = message?.maxSelectCount ?? 500;
        console.info('testPicker_static_12 result event.data.msg=:' + result);
        console.info('testPicker_static_12 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_12 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_12 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_13
     * @tc.name     testPicker_static_13
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's orientation property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level2
     */
    it('testPicker_static_13', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.orientation = PickerOrientation.VERTICAL;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const message: PhotoPickerResult | null = (data['msg'] as PhotoPickerResult) ?? null;
        let expectResult: int = PickerOrientation.VERTICAL ?? PickerOrientation.HORIZONTAL;
        const result: int = message?.orientation ?? 0;
        console.info('testPicker_static_13 result event.data.msg=:' + result);
        console.info('testPicker_static_13 result expect =:' + expectResult);
        expect(result == expectResult).assertTrue();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_13 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('testPicker_static_13 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_16
     * @tc.name     testPicker_static_16
     * @tc.desc     Testing Album
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_16', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.ALBUM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
      albumOptions.themeColorMode = PickerColorMode.DARK;
      albumOptions.filterType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        let result: ItemInfo | null = (data['msg'] as ItemInfo) ?? null;
        if (result == null) {
          console.error('result is null');
          return;
        }
        console.info('testPicker_static_16 select ItemInfo=:' + JSON.stringify(result));
        expect(result!.uri).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
          albumOptions: albumOptions
        } as RouterOptionsParams
      }
      await routeToUrl(options);

      console.info('testPicker_static_16 create');
      await clickAlbumButton(driver);
      await Utils.msSleep(2000);

      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_16 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('testPicker_static_16 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_17
     * @tc.name     testPicker_static_17
     * @tc.desc     Testing PhotoBrowerInfo
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_17', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const msgObj = data['msg'];
        if (!msgObj) {
          console.error('Field msg is missing in event.data');
          return;
        }
        let result: PhotoBrowserInfo = msgObj as PhotoBrowserInfo;
        console.info('testPicker_static_17 select PhotoBrowerInfo=:' + JSON.stringify(result));
        expect(result.animatorParams).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);

      console.info('testPicker_static_17 create');
      await clickBigPicture(driver);

      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_17 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('testPicker_static_17 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_18
     * @tc.name     testPicker_static_18
     * @tc.desc     Testing PhotoBrowerInfo
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_18', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.SELECT_CLICKTYPE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let clicked: boolean = false;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const rawData = data['msg'];
        if (rawData === undefined || rawData === null) {
          console.error('Field msg is missing or null');
          return;
        }
        let result: number = rawData as number;

        console.info('testPicker_static_18 select number =:' + JSON.stringify(result));
        if (clicked) {
          expect(result == ClickType.DESELECTED).assertTrue();
        } else {
          expect(result == ClickType.SELECTED).assertTrue();
        }
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);

      console.info('testPicker_static_18 create');
      let btn: Component | null = await driver.findComponent(ON.type('GridItem'));
      if (btn === null) {
        console.info('testPicker_static_18 no GridItem');
      } else {
        await btn!.click();
        await Utils.msSleep(1000);
        clicked = !clicked;
        await Utils.msSleep(1000);
        await btn!.click();
        await Utils.msSleep(1000);
      }

      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_18 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('testPicker_static_18 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_19
     * @tc.name     testPicker_static_19
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.ALL)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_19', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const rawData = data['msg'];
        if (rawData === undefined || rawData === null) {
          console.error('Field msg is missing or null');
          return;
        }
        let baseItemInfo: BaseItemInfo = rawData as BaseItemInfo;
        console.info('testPicker_static_19 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        } as RouterRecentPhotoOptions
      }
      await routeToUrl(options);
      console.info('testPicker_static_19 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('testPicker_static_19 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('testPicker_static_19 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_20
     * @tc.name     testPicker_static_20
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.CAMERA)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_20', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.CAMERA;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const rawData = data['msg'];
        if (rawData === undefined || rawData === null) {
          console.error('Field msg is missing or null');
          return;
        }
        const baseItemInfo: BaseItemInfo = rawData as BaseItemInfo;
        console.info('testPicker_static_20 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        } as RouterRecentPhotoOptions
      }
      await routeToUrl(options);
      console.info('testPicker_static_20 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('testPicker_static_20 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('testPicker_static_20 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_21
     * @tc.name     testPicker_static_21
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.SCREENSHOT)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('testPicker_static_21', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.SCREENSHOT;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const rawData = data['msg'];
        if (rawData === undefined || rawData === null) {
          console.error('Field msg is missing or null');
          return;
        }
        const baseItemInfo: BaseItemInfo = rawData as BaseItemInfo;

        console.info('testPicker_static_21 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        } as RouterRecentPhotoOptions
      }
      await routeToUrl(options);
      console.info('testPicker_static_21 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('testPicker_static_21 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('testPicker_static_21 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_22
     * @tc.name     testPicker_static_22
     * @tc.desc     Testing PhotoPickerComponent set browser back button and checkbox
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_22', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      // 支持滑动多选
      pickerOptions.isSlidingSelectionSupported = true;
      // 设置大图页checkbox位置
      pickerOptions.photoBrowserCheckboxPosition = [0.5, 0.5];
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_22 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      await Utils.msSleep(2000);
      routerInstance.back();
      console.info('testPicker_static_22 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_23
     * @tc.name     testPicker_static_23
     * @tc.desc     Testing requestPhotoUrisReadPermission
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('testPicker_static_23', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let uris = ['file://media/photo/test.jpg'];
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null = photoAccessHelper.getPhotoAccessHelper(appContext);
      try {
        phAccessHelper!.requestPhotoUrisReadPermission(uris).then((result: Array<string>) => {
          console.info('requestPhotoUrisReadPermission, result = ' + JSON.stringify(result));
          if (result) {
            console.info('requestPhotoUrisReadPermission success');
          } else {
            console.error('testPicker_static_23 empty result');
            expect().assertFail();
          }
        })
      } catch (error) {
        console.error('testPicker_static_23 error: ' + JSON.stringify(error));
        expect().assertFail();
      }
      console.info('testPicker_static_23 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_24
     * @tc.name     testPicker_static_24
     * @tc.desc     Testing CompleteButtonText
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_24', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
      }

      for (let index: int = 0; index < 3; index++) {
        await routeToUrl(options);
        await Utils.msSleep(2000);
        let ret: boolean = await testCompleteButton(driver, index);
        expect(ret).assertTrue();
        await Utils.msSleep(2000);
        routerInstance.back();
        await Utils.msSleep(2000);
      }
      console.info('testPicker_static_24 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_25
     * @tc.name     testPicker_static_25
     * @tc.desc     Testing createAssetWithShortTermPermission
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('testPicker_static_25', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null = photoAccessHelper.getPhotoAccessHelper(appContext);
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
        phAccessHelper!.createAssetWithShortTermPermission(photoCreationConfig).then((result) => {
          console.info('createAssetWithShortTermPermission, result=' + JSON.stringify(result));
          if (result) {
            console.info('createAssetWithShortTermPermission success');
          } else {
            console.error('testPicker_static_25 empty result');
            expect().assertFail();
          }
        })
      } catch (error) {
        console.error('testPicker_static_25 error: ' + JSON.stringify(error));
        expect().assertFail();
      }
      console.info('testPicker_static_25 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_26
     * @tc.name     testPicker_static_26
     * @tc.desc     Testing PhotoPickerComponent grid margin and browser margin
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_26', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      // 支持传入宫格和大图Margin
      pickerOptions.gridMargin = { top: 10 };
      pickerOptions.photoBrowserMargin = { top: 20 };
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_26 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('testPicker_static_26 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_27
     * @tc.name     testPicker_static_27
     * @tc.desc     Testing video play state changed callback
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_27', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.VIDEO_PLAY_STATE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: number = eventData['msg'] as number;
        console.info('testPicker_static_27 state =:' + JSON.stringify(result));
        let videoCallBackState: int = eventData['videoCallBackState'] as int;
        if (videoCallBackState === SEEK_START) {
          console.log('state is SEEK_START:' + videoCallBackState);
        } else if (videoCallBackState === SEEK_FINISH) {
          console.log('state is SEEK_FINISH:' + videoCallBackState);
        } else {
          expect(true).assertFalse();
        }
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_27 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('testPicker_static_27 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   testPicker_static_28
     * @tc.name     testPicker_static_28
     * @tc.desc     Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('testPicker_static_28', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let originalUris = [' '];
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(appContext.filesDir + '/test.jpg').toString();
        photoAccessHelper.getPhotoAccessHelper(appContext)!.showAssetsCreationDialog([boxPath],
          [photoCreationConfig]).then((result) => {
            originalUris = result;
          });
        await Utils.msSleep(1000);
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (a) => {
          if (!a) {
            console.log('testPicker_static_28 replacePhotoPickerPreview fail');
            expect().assertFail();
          } else {
            console.log('testPicker_static_28 replacePhotoPickerPreview success');
            pickerController.saveTrustedPhotoAssets([boxPath], (err: BusinessError | null, arr: Array<string> | undefined) => {
              if (err && err.code != 0) {
                console.log('testPicker_static_28 saveTrustedPhotoAssets fail');
                expect().assertFail();
              } else {
                console.log('testPicker_static_28 saveTrustedPhotoAssets success, save uris:' + arr);
              }
            }, undefined, SaveMode.SAVE_AS);
          }
        });
      } catch (error) {
        console.log('testPicker_static_28 error:' + JSON.stringify(error));
        expect().assertFail();
      }
      await clickAgreeSave(driver);
      await Utils.msSleep(1000);
      done();
    });

    /**
     * @tc.number   testPicker_static_29
     * @tc.name     testPicker_static_29
     * @tc.desc     Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('testPicker_static_29', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let originalUris = [' '];
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(appContext.filesDir + '/test.jpg').toString();
        photoAccessHelper.getPhotoAccessHelper(appContext)!.showAssetsCreationDialog([boxPath],
          [photoCreationConfig]).then((result) => {
            originalUris = result;
          });
        console.log('testPicker_static_29 originalUris' + originalUris);
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (a) => {
          if (!a) {
            console.log('testPicker_static_29 replacePhotoPickerPreview fail');
            expect().assertFail();
          } else {
            console.log('testPicker_static_29 replacePhotoPickerPreview success');
            pickerController.saveTrustedPhotoAssets([boxPath], (err: BusinessError | null, arr: Array<string> | undefined) => {
              console.log('testPicker_static_29 saveTrustedPhotoAssets success');
              if (err && err.code != 0) {
                console.log('testPicker_static_29 saveTrustedPhotoAssets fail');
                expect().assertFail();
              } else {
                console.log('testPicker_static_29 saveTrustedPhotoAssets success, save uris:' + arr);
              }
            }, undefined, SaveMode.OVERWRITE);
          }
        });
      } catch (error) {
        console.log('testPicker_static_29 error:' + JSON.stringify(error));
        expect().assertFail();
      }
      await clickAgreeSave(driver);
      await Utils.msSleep(1000);
      done();
    });

    /**
     * @tc.number   testPicker_static_30
     * @tc.name     testPicker_static_30
     * @tc.desc     Testing createAssetWithShortTermPermission
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('testPicker_static_30', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null = photoAccessHelper.getPhotoAccessHelper(appContext);
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: '',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
        await phAccessHelper!.createAssetWithShortTermPermission(photoCreationConfig);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error('testPicker_static_30 error: ' + JSON.stringify(error) + error.code);
        expect(error.code == 401).assertTrue();
      }
      console.info('testPicker_static_30 finish');
      done();
    });

    /**
     * @tc.number   testPicker_static_32
     * @tc.name     testPicker_static_32
     * @tc.desc     Testing mimeTypeFilter fileSizeFilter videoDurationFilter
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_32', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png', 'image/jpeg', 'video/*']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.MORE_THAN,
        fileSize: 1
      }
      photoSelectOptions.videoDurationFilter = {
        filterOperator: photoAccessHelper.FilterOperator.BETWEEN,
        videoDuration: 1,
        extraVideoDuration: 10000
      }
      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_32, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_32, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_32 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_33
     * @tc.name     testPicker_static_33
     * @tc.desc     Testing FilterOperator.BETWEEN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_33', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.BETWEEN,
        fileSize: 1,
        extraFileSize: 1000000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_33, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_33, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_33 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_34
     * @tc.name     testPicker_static_34
     * @tc.desc     Testing FilterOperator.LESS_THAN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_34', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.LESS_THAN,
        fileSize: 100000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_34, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_34, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_34 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_35
     * @tc.name     testPicker_static_35
     * @tc.desc     Testing FilterOperator.EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_35', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.EQUAL_TO,
        fileSize: 10000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_35, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_35, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_35 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_36
     * @tc.name     testPicker_static_36
     * @tc.desc     Testing FilterOperator.NOT_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_36', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.NOT_EQUAL_TO,
        fileSize: 10000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_36, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_36, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_36 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_37
     * @tc.name     testPicker_static_37
     * @tc.desc     Testing FilterOperator.MORE_THAN_OR_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_37', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.MORE_THAN_OR_EQUAL_TO,
        fileSize: 1000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_37, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_37, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_37 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_38
     * @tc.name     testPicker_static_38
     * @tc.desc     Testing FilterOperator.LESS_THAN_OR_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_38', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      photoSelectOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.LESS_THAN_OR_EQUAL_TO,
        fileSize: 100000
      }

      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(photoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker_static_38, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          expect(PhotoSelectResult).not().assertNull();
        })
      } catch (e) {
        let err = e as BusinessError;
        expect().assertFail();
        console.error(`testPicker_static_38, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info('testPicker_static_38 finish');
      await Utils.msSleep(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number   testPicker_static_39
     * @tc.name     testPicker_static_39
     * @tc.desc     Testing PhotoPickerComponent singleLineConfig
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('testPicker_static_39', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: Long = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.singleLineConfig = {
        itemDisplayRatio: ItemDisplayRatio.SQUARE_RATIO,
        itemBorderRadius: {
          topLeft: 8,
          bottomRight: 8
        },
        itemGap: '10vp'
      };
      pickerOptions.singleLineConfig!.itemDisplayRatio = ItemDisplayRatio.ORIGINAL_SIZE_RATIO;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker_static_39 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('testPicker_static_39 finish');
      done();
    });
  })
}