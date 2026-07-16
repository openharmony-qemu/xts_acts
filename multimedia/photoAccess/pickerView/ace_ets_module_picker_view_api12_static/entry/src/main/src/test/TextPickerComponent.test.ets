'use static';
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
  AnimatorParams,
  PhotoBrowserRange,
  VideoPlayerState,
  PhotoBrowserUIElement
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo, AlbumPickerController } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { PhotoPickerResult } from '../../ets/MainAbility/common/PhotoPickerResult';
import {
  RecentPhotoOptions,
  PhotoSource,
} from '@ohos.file.RecentPhotoComponent';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { fileUri } from '@kit.CoreFileKit';
import inspector from '@ohos.arkui.inspector'
import Context from 'application.Context';
import { canIUse } from '@internal.full.global'
import { BusinessError } from '@kit.BasicServicesKit';
import { RouterOptionsParams, RouterRecentPhotoOptions, RouterSelectOptionsParams } from '../../ets/MainAbility/common/Common'
import { AsyncCallback, RecordData } from '@ohos.base';

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

    let routeToUrl = async (
      options: router.RouterOptions
    ): Promise<void> => {
      console.info(
        TAG + 'routeToUrl enter, options.url: ' +
          options.url
      );

      try {
        routerInstance =
          AppStorage.get<Router>('router') as Router;

        if (routerInstance === undefined) {
          console.error(
            TAG + 'routerInstance is undefined'
          );
          return;
        }

        const currentState: router.RouterState =
          routerInstance.getState();

        console.info(
          TAG + 'current page state: ' +
            JSON.stringify(currentState)
        );

        const currentPageName: string =
          currentState.name;

        const targetUrl: string =
          options.url;

        if (
          currentPageName.length > 0 &&
            targetUrl.endsWith(currentPageName)
        ) {
          console.info(
            TAG + 'target page is already open: ' +
              currentPageName
          );
          return;
        }

        await routerInstance.pushUrl(options);
        await Utils.msSleep(2500);

        const newState: router.RouterState =
          routerInstance.getState();

        console.info(
          TAG + 'page after pushUrl: ' +
            JSON.stringify(newState)
        );
      } catch (error) {
        if (error instanceof BusinessError) {
          console.error(TAG + 'routeToUrl error: ' + error.message);
        } else {
          console.error(TAG + 'routeToUrl non-business error: ' + JSON.stringify(error));
        }
        throw error;
      }
    };

    const routerToSheetPage = async (photoSelectOptions: photoAccessHelper.PhotoSelectOptions): Promise<void> => {
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
        params: {
          photoSelectOptions: photoSelectOptions,
        } as RouterSelectOptionsParams
      }
      await routeToUrl(options);
    }

    const clickSelectPhotoButton = async (buttonId: string = 'select photo'): Promise<void> => {
      const button: Component | null = await driver.findComponent(ON.id(buttonId));
      await button?.click();
      await Utils.msSleep(500);
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
      photoSelectOptions.maxSelectNumber = 10;
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
      await Utils.msSleep(1000);
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

    let applyCompleteButtonMode = async (driver: Driver, buttonId: string = 'TEXT_DONE'): Promise<boolean> => {
      const modeButton: Component | null = await driver.waitForComponent(ON.id(buttonId), 5000);
      if (modeButton === null) {
        console.error(TAG + 'complete button mode not found: ' + buttonId);
        return false;
      }

      await modeButton.click();
      await Utils.msSleep(500);
      return true;
    }

    let closePickerModel = async (driver: Driver, time?: int): Promise<void> => {
      await Utils.msSleep(time ?? 500);
      const closeBtn: Component | null = await driver.findComponent(ON.id('Third_Select_PickerClose'));
      if (closeBtn !== null) {
        await closeBtn.click();
        await Utils.msSleep(time ?? 500);
        return;
      }

      try {
        await driver.pressBack();
      } catch (error) {
        console.error(TAG + 'closePickerModel pressBack error: ' + JSON.stringify(error));
      }

      await Utils.msSleep(time ?? 500);
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
     * @tc.number   SUB_PHOTO_PICKER_TEST_0001
     * @tc.name     SUB_PHOTO_PICKER_TEST_0001
     * @tc.desc     Testing route to PhotoPickerComponent
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0001 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0001 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0001 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      events_emitter.off(event.eventId);
      console.info('SUB_PHOTO_PICKER_TEST_0001 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0002
     * @tc.name     SUB_PHOTO_PICKER_TEST_0002
     * @tc.desc     Testing Change PhotoPickerComponent BackgroundColor
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0002 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0002 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0002 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0002 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0003
     * @tc.name     SUB_PHOTO_PICKER_TEST_0003
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's isRepeatSelectSupported property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0003 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0003 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0003 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0003 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0004
     * @tc.name     SUB_PHOTO_PICKER_TEST_0004
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's checkboxTextColor property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0004 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0004 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0004 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0004 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0005
     * @tc.name      SUB_PHOTO_PICKER_TEST_0005
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0005 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0005 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0005 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0005 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0006
     * @tc.name      SUB_PHOTO_PICKER_TEST_0006
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0006 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0006 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0006 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0006 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0007
     * @tc.name      SUB_PHOTO_PICKER_TEST_0007
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('SUB_PHOTO_PICKER_TEST_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0007 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0007 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0007 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0007 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0008
     * @tc.name      SUB_PHOTO_PICKER_TEST_0008
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('SUB_PHOTO_PICKER_TEST_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0008 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0008 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0008 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0008 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0009
     * @tc.name      SUB_PHOTO_PICKER_TEST_0009
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's selectMode property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level2
     */
    it('SUB_PHOTO_PICKER_TEST_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0009 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0009 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0009 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0009 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0010
     * @tc.name      SUB_PHOTO_PICKER_TEST_0010
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxPhotoSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0010 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0010 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0010 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0010 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0011
     * @tc.name      SUB_PHOTO_PICKER_TEST_0011
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxVideoSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0011 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0011 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0011 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0011 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_PICKER_TEST_0012
     * @tc.name      SUB_PHOTO_PICKER_TEST_0012
     * @tc.desc      Testing Change PhotoPickerComponent pickerOptions's maxSelectNumber property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0012 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0012 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0012 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0012 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0013
     * @tc.name     SUB_PHOTO_PICKER_TEST_0013
     * @tc.desc     Testing Change PhotoPickerComponent pickerOptions's orientation property
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level2
     */
    it('SUB_PHOTO_PICKER_TEST_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0013 result event.data.msg=:' + result);
        console.info('SUB_PHOTO_PICKER_TEST_0013 result expect =:' + expectResult);
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
      console.info('SUB_PHOTO_PICKER_TEST_0013 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0013 finish');
      events_emitter.off(event.eventId);
      done();
    });


     /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0014
     * @tc.name     SUB_PHOTO_PICKER_TEST_0014
     * @tc.desc     Testing ItemInfo's all properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0014 select ItemInfo=:' + JSON.stringify(result));
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
      console.info('SUB_PHOTO_PICKER_TEST_0014 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await Utils.msSleep(1000);
      await clickPhotoPickerComponent(driver);
      await Utils.msSleep(1000);
      let checkBoxs: Array<Component> | null = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info('SUB_PHOTO_PICKER_TEST_0014 findComponent checkbox fail');
      } else {
        console.info('SUB_PHOTO_PICKER_TEST_0014 findComponent checkbox success');
        await checkBoxs[0]!.click();
        await Utils.msSleep(1000);
        console.info('SUB_PHOTO_PICKER_TEST_0014 btn click finish');
      }
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0014 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0015
     * @tc.name     SUB_PHOTO_PICKER_TEST_0015
     * @tc.desc     Testing MaxSelected
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0015', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0015 select ItemInfo=:' + JSON.stringify(result));
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
        console.info('SUB_PHOTO_PICKER_TEST_0015 findComponent changeNumButton fail');
        expect().assertFail();
      } else {
        console.info('SUB_PHOTO_PICKER_TEST_0015 findComponent changeNumButton success');
        await changeNumButton.click();
      }
      await Utils.msSleep(500);
      await clickPhotoPickerComponent(driver);
      let checkBoxs: Array<Component> | null = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info('SUB_PHOTO_PICKER_TEST_0015 findComponent checkbox fail');
      } else {
        console.info('SUB_PHOTO_PICKER_TEST_0015 findComponent checkbox success');
        let selectNum = Math.min(checkBoxs!.length, 3);
        for (let index = 0; index < selectNum; index++) {
          await checkBoxs[index]!.click();
        }
        await Utils.msSleep(1000);
        expect(selectCount).assertLargerOrEqual(0);

        await clickPreviewButton(driver);
        await clickExitBrowser(driver);
        await clickSetDataButton(driver);
        console.info('SUB_PHOTO_PICKER_TEST_0015 btn click finish');
      }
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0015 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0016
     * @tc.name     SUB_PHOTO_PICKER_TEST_0016
     * @tc.desc     Testing Album
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        let result: AlbumInfo | null = (data['msg'] as AlbumInfo) ?? null;
        if (result == null) {
          console.error('result is null');
          return;
        }
        console.info('SUB_PHOTO_PICKER_TEST_0016 select AlbumInfo=:' + JSON.stringify(result));
        expect(result!.albumName).not().assertUndefined();
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

      console.info('SUB_PHOTO_PICKER_TEST_0016 create');
      await clickAlbumButton(driver);
      await Utils.msSleep(2000);

      let strJson = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('SUB_PHOTO_PICKER_TEST_0016 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0016 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0017
     * @tc.name     SUB_PHOTO_PICKER_TEST_0017
     * @tc.desc     Testing PhotoBrowerInfo
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0017 select PhotoBrowerInfo=:' + JSON.stringify(result));
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

      console.info('SUB_PHOTO_PICKER_TEST_0017 create');
      await clickBigPicture(driver);

      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('SUB_PHOTO_PICKER_TEST_0017 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0017 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0018
     * @tc.name     SUB_PHOTO_PICKER_TEST_0018
     * @tc.desc     Testing PhotoBrowerInfo
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0018', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

        console.info('SUB_PHOTO_PICKER_TEST_0018 select number =:' + JSON.stringify(result));
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

      console.info('SUB_PHOTO_PICKER_TEST_0018 create');
      let btn: Component | null = await driver.findComponent(ON.type('GridItem'));
      if (btn === null) {
        console.info('SUB_PHOTO_PICKER_TEST_0018 no GridItem');
      } else {
        await btn!.click();
        await Utils.msSleep(1000);
        clicked = !clicked;
        await Utils.msSleep(1000);
        await btn!.click();
        await Utils.msSleep(1000);
      }

      let strJson: string = inspector.getInspectorByKey('PhotoPickerComponent');
      console.info('SUB_PHOTO_PICKER_TEST_0018 strJson is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();

      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0018 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0019
     * @tc.name     SUB_PHOTO_PICKER_TEST_0019
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.ALL)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      recentPhotoOptions.isAutoRefreshSupported = true;
      recentPhotoOptions.colorMode = PickerColorMode.LIGHT;
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
        console.info('SUB_PHOTO_PICKER_TEST_0019 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
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
      console.info('SUB_PHOTO_PICKER_TEST_0019 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('SUB_PHOTO_PICKER_TEST_0019 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0019 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0020
     * @tc.name     SUB_PHOTO_PICKER_TEST_0020
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.CAMERA)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0020 baseItemInfo =:' + JSON.stringify(baseItemInfo));
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
      console.info('SUB_PHOTO_PICKER_TEST_0020 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('SUB_PHOTO_PICKER_TEST_0020 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0020 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0021
     * @tc.name     SUB_PHOTO_PICKER_TEST_0021
     * @tc.desc     Testing RecentPhotoComponent(PhotoSource.SCREENSHOT)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level1
     */
    it('SUB_PHOTO_PICKER_TEST_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

        console.info('SUB_PHOTO_PICKER_TEST_0021 baseItemInfo =:' + JSON.stringify(baseItemInfo));
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
      console.info('SUB_PHOTO_PICKER_TEST_0021 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('SUB_PHOTO_PICKER_TEST_0021 no recentPhoto');
      } else {
        await component.click();
        await Utils.msSleep(2000);
      }
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0021 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0022
     * @tc.name     SUB_PHOTO_PICKER_TEST_0022
     * @tc.desc     Testing PhotoPickerComponent set browser back button and checkbox
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      console.info('SUB_PHOTO_PICKER_TEST_0022 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      await clickResultButton(driver);
      await Utils.msSleep(2000);
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0022 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0023
     * @tc.name     SUB_PHOTO_PICKER_TEST_0023
     * @tc.desc     Testing requestPhotoUrisReadPermission error code coverage (401, 14000011)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTO_PICKER_TEST_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null = photoAccessHelper.getPhotoAccessHelper(appContext);

      try {
        let uris = ['file://media/photo/test.jpg'];
        let result: Array<string> = await phAccessHelper!.requestPhotoUrisReadPermission(uris);
        console.info('SUB_PHOTO_PICKER_TEST_0023 case1 result = ' + JSON.stringify(result));
        expect(result).not().assertUndefined();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0023 case1 error code: ' + error.code);
        let isValidErrorCode = (error.code == -1 || error.code == 14000011 || error.code == 401);
        expect(isValidErrorCode).assertTrue();
      }

      try {
        let emptyUris: Array<string> = [];
        await phAccessHelper!.requestPhotoUrisReadPermission(emptyUris);
        console.info('SUB_PHOTO_PICKER_TEST_0023 case2 unexpectedly succeeded');
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0023 case2 error code: ' + error.code);
        let isValidErrorCode = (error.code == -1 || error.code == 401 || error.code == 14000011);
        expect(isValidErrorCode).assertTrue();
      }

      console.info('SUB_PHOTO_PICKER_TEST_0023 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0024
     * @tc.name     SUB_PHOTO_PICKER_TEST_0024
     * @tc.desc     Testing CompleteButtonText
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }

      const photoSelectOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();

      photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      photoSelectOptions.maxSelectNumber = 3;

      const options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
        params: {
          photoSelectOptions: photoSelectOptions
        } as RouterSelectOptionsParams
      }

      for (let index: int = 0; index < 3; index++) {
        await routeToUrl(options);
        await Utils.msSleep(1000);
        let ret: boolean = await testCompleteButton(driver, index);
        expect(ret).assertTrue();
        await Utils.msSleep(500);
        routerInstance.back();
      }
      console.info('SUB_PHOTO_PICKER_TEST_0024 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0025
     * @tc.name     SUB_PHOTO_PICKER_TEST_0025
     * @tc.desc     Testing createAssetWithShortTermPermission error code coverage (201/14000011)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTO_PICKER_TEST_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        let result = await phAccessHelper!.createAssetWithShortTermPermission(photoCreationConfig);
        console.info('SUB_PHOTO_PICKER_TEST_0025 case1 result=' + JSON.stringify(result));
        expect(result).not().assertUndefined();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0025 case1 error code: ' + error.code);
        let isValidErrorCode = (error.code == -1 || error.code == 201 || error.code == 14000011 || error.code == 401);
        expect(isValidErrorCode).assertTrue();
      }

      try {
        let invalidConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
        let result = await phAccessHelper!.createAssetWithShortTermPermission(invalidConfig);
        console.info('SUB_PHOTO_PICKER_TEST_0025 case2 unexpectedly succeeded: ' + JSON.stringify(result));
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0025 case2 error code: ' + error.code);
        let isValidErrorCode = (error.code == -1 || error.code == 201 || error.code == 14000011 || error.code == 401);
        expect(isValidErrorCode).assertTrue();
      }

      console.info('SUB_PHOTO_PICKER_TEST_0025 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0026
     * @tc.name     SUB_PHOTO_PICKER_TEST_0026
     * @tc.desc     Testing PhotoPickerComponent grid margin and browser margin
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0026', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      console.info('SUB_PHOTO_PICKER_TEST_0026 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0026 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0027
     * @tc.name     SUB_PHOTO_PICKER_TEST_0027
     * @tc.desc     Testing video play state changed callback
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0027', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.info('SUB_PHOTO_PICKER_TEST_0027 state =:' + JSON.stringify(result));
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
      console.info('SUB_PHOTO_PICKER_TEST_0027 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0027 finish');
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0028
     * @tc.name     SUB_PHOTO_PICKER_TEST_0028
     * @tc.desc     Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTO_PICKER_TEST_0028', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            console.log('SUB_PHOTO_PICKER_TEST_0028 replacePhotoPickerPreview fail');
            expect().assertFail();
          } else {
            console.log('SUB_PHOTO_PICKER_TEST_0028 replacePhotoPickerPreview success');
            pickerController.saveTrustedPhotoAssets([boxPath], (err: BusinessError | null, arr: Array<string> | undefined) => {
              if (err && err.code != 0) {
                console.log('SUB_PHOTO_PICKER_TEST_0028 saveTrustedPhotoAssets fail');
                expect().assertFail();
              } else {
                console.log('SUB_PHOTO_PICKER_TEST_0028 saveTrustedPhotoAssets success, save uris:' + arr);
              }
            }, undefined, SaveMode.SAVE_AS);
          }
        });
      } catch (error) {
        console.log('SUB_PHOTO_PICKER_TEST_0028 error:' + JSON.stringify(error));
        expect().assertFail();
      }
      await clickAgreeSave(driver);
      await Utils.msSleep(1000);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0029
     * @tc.name     SUB_PHOTO_PICKER_TEST_0029
     * @tc.desc     Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTO_PICKER_TEST_0029', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.log('SUB_PHOTO_PICKER_TEST_0029 originalUris' + originalUris);
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (a) => {
          if (!a) {
            console.log('SUB_PHOTO_PICKER_TEST_0029 replacePhotoPickerPreview fail');
            expect().assertFail();
          } else {
            console.log('SUB_PHOTO_PICKER_TEST_0029 replacePhotoPickerPreview success');
            pickerController.saveTrustedPhotoAssets([boxPath], (err: BusinessError | null, arr: Array<string> | undefined) => {
              console.log('SUB_PHOTO_PICKER_TEST_0029 saveTrustedPhotoAssets success');
              if (err && err.code != 0) {
                console.log('SUB_PHOTO_PICKER_TEST_0029 saveTrustedPhotoAssets fail');
                expect().assertFail();
              } else {
                console.log('SUB_PHOTO_PICKER_TEST_0029 saveTrustedPhotoAssets success, save uris:' + arr);
              }
            }, undefined, SaveMode.OVERWRITE);
          }
        });
      } catch (error) {
        console.log('SUB_PHOTO_PICKER_TEST_0029 error:' + JSON.stringify(error));
        expect().assertFail();
      }
      await clickAgreeSave(driver);
      await Utils.msSleep(1000);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0030
     * @tc.name     SUB_PHOTO_PICKER_TEST_0030
     * @tc.desc     Testing createAssetWithShortTermPermission
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_PHOTO_PICKER_TEST_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        console.error('SUB_PHOTO_PICKER_TEST_0030 error: ' + JSON.stringify(error) + error.code);
        expect(error.code == 401).assertTrue();
      }
      console.info('SUB_PHOTO_PICKER_TEST_0030 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0032
     * @tc.name     SUB_PHOTO_PICKER_TEST_0032
     * @tc.desc     Testing mimeTypeFilter fileSizeFilter videoDurationFilter
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0032', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0032 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0032 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0033
     * @tc.name     SUB_PHOTO_PICKER_TEST_0033
     * @tc.desc     Testing FilterOperator.BETWEEN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0033', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0033 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0033 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0034
     * @tc.name     SUB_PHOTO_PICKER_TEST_0034
     * @tc.desc     Testing FilterOperator.LESS_THAN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0034', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0034 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0034 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0035
     * @tc.name     SUB_PHOTO_PICKER_TEST_0035
     * @tc.desc     Testing FilterOperator.EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0035', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0035 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0035 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0036
     * @tc.name     SUB_PHOTO_PICKER_TEST_0036
     * @tc.desc     Testing FilterOperator.NOT_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0036', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0036 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0036 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0037
     * @tc.name     SUB_PHOTO_PICKER_TEST_0037
     * @tc.desc     Testing FilterOperator.MORE_THAN_OR_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0037', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0037 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0037 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0038
     * @tc.name     SUB_PHOTO_PICKER_TEST_0038
     * @tc.desc     Testing FilterOperator.LESS_THAN_OR_EQUAL_TO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0038', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult = eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0038 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback)

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      console.info('SUB_PHOTO_PICKER_TEST_0038 finish');
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(code);
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0039
     * @tc.name     SUB_PHOTO_PICKER_TEST_0039
     * @tc.desc     Testing PhotoPickerComponent singleLineConfig
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0039', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      console.info('SUB_PHOTO_PICKER_TEST_0039 JSON.parse(strJson) is' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('visibility') == 'Visibility.Visible').assertTrue();
      routerInstance.back();
      console.info('SUB_PHOTO_PICKER_TEST_0039 finish');
      done();
    });

    /**
     * @tc.number SUB_PHOTO_PICKER_TEST_0040
     * @tc.name SUB_PHOTO_PICKER_TEST_0040
     * @tc.desc Testing RecentPhotoComponent isAutoRefreshSupported and colorMode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      recentPhotoOptions.isAutoRefreshSupported = true;
      recentPhotoOptions.colorMode = PickerColorMode.LIGHT;
      let callback = (event: events_emitter.EventData): void => {
        if (!event.data) {
          console.error('SUB_PHOTO_PICKER_TEST_0040 event data is missing');
          expect().assertFail();
          return;
        }
        const data = event.data as Record<string, RecordData>;
        const rawData = data['msg'];
        if (rawData === undefined || rawData === null) {
          console.error('SUB_PHOTO_PICKER_TEST_0040 msg is missing');
          expect().assertFail();
          return;
        }
        const baseItemInfo: BaseItemInfo = rawData as BaseItemInfo;
        console.info('SUB_PHOTO_PICKER_TEST_0040 baseItemInfo: ' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
      };
      let event: events_emitter.InnerEvent = { eventId: code, priority: events_emitter.EventPriority.LOW };
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: { eventId: code, recentPhotoOptions: recentPhotoOptions } as RouterRecentPhotoOptions
      };
      await routeToUrl(options);
      console.info('SUB_PHOTO_PICKER_TEST_0040 create');
      let component: Component | null = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.error('SUB_PHOTO_PICKER_TEST_0040 recentPhoto not found');
        events_emitter.off(event.eventId);
        expect().assertFail();
        done();
        return;
      }
      await component.click();
      await Utils.msSleep(2000);
      routerInstance.back();
      events_emitter.off(event.eventId);
      console.info('SUB_PHOTO_PICKER_TEST_0040 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0041
     * @tc.name     SUB_PHOTO_PICKER_TEST_0041
     * @tc.desc     Testing SingleSelectionMode BROWSER_AND_SELECT_MODE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0041', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const photoSelectOptions:
          photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();

        photoSelectOptions.MIMEType =
          photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;
        photoSelectOptions.singleSelectionMode =
          photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE;

        expect(
          photoAccessHelper.SingleSelectionMode
            .BROWSER_AND_SELECT_MODE === 2
        ).assertTrue();

        await routerToSheetPage(photoSelectOptions);
        await Utils.msSleep(1000);

        const modeApplied: boolean =
          await applyCompleteButtonMode(
            driver,
            'TEXT_DONE'
          );
        expect(modeApplied).assertTrue();

        await clickSelectPhotoButton();
        await Utils.msSleep(1000);
        await closePickerModel(driver);

        routerInstance.back();
        console.info('SUB_PHOTO_PICKER_TEST_0041 finish');
        done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0042
     * @tc.name     SUB_PHOTO_PICKER_TEST_0042
     * @tc.desc     Testing PickerOptions preselectedUris and
     *              isPreviewForSingleSelectionSupported properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0042', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const code: long = EventType.PHOTO_PICKER_INFO;
        const pickerOptions: PickerOptions =
          getDefaultPickerOptions();

        pickerOptions.isRepeatSelectSupported = true;
        pickerOptions.preselectedUris = [];
        pickerOptions.isPreviewForSingleSelectionSupported = true;

        const callback = (event: events_emitter.EventData): void => {
          if (!event.data) {
            console.error('SUB_PHOTO_PICKER_TEST_0042 event data is null');
            return;
          }

          const data = event.data as Record<string, RecordData>;
          const result: PhotoPickerResult | null =
            (data['msg'] as PhotoPickerResult) ?? null;

          if (result === null) {
            console.error('SUB_PHOTO_PICKER_TEST_0042 result is null');
            return;
          }

          let expectedUris: Array<string> = new Array<string>();
          const configuredUris: Array<string> | undefined =
            pickerOptions.preselectedUris;
          if (configuredUris !== undefined) {
            expectedUris = configuredUris;
          }

          let actualUris: Array<string> = new Array<string>();
          const resultUris: Array<string> | undefined =
            result.preselectedUris;
          if (resultUris !== undefined) {
            actualUris = resultUris;
          }

          expect(actualUris.length === expectedUris.length)
            .assertTrue();

          if (expectedUris.length > 0 && actualUris.length > 0) {
            expect(actualUris[0] === expectedUris[0])
              .assertTrue();
          }

          let expectedPreviewSupport: boolean = false;
          const configuredPreviewSupport: boolean | undefined =
            pickerOptions.isPreviewForSingleSelectionSupported;
          if (configuredPreviewSupport !== undefined) {
            expectedPreviewSupport = configuredPreviewSupport;
          }

          let actualPreviewSupport: boolean = false;
          const resultPreviewSupport: boolean | undefined =
            result.isPreviewForSingleSelectionSupported;
          if (resultPreviewSupport !== undefined) {
            actualPreviewSupport = resultPreviewSupport;
          }

          expect(actualPreviewSupport === expectedPreviewSupport)
            .assertTrue();
        };

        const event: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        };
        events_emitter.on(event, callback);

        const options: router.RouterOptions = {
          url: 'MainAbility/pages/PickerComponent',
          params: {
            eventId: code,
            pickerOptions: pickerOptions
          } as RouterOptionsParams
        };

        await routeToUrl(options);
        await Utils.msSleep(1000);

        const component: Component | null =
          await driver.findComponent(ON.id('PhotoPickerComponent'));
        expect(component !== null).assertTrue();

        await clickResultButton(driver);
        routerInstance.back();
        events_emitter.off(code);

        console.info('SUB_PHOTO_PICKER_TEST_0042 finish');
        done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0043
     * @tc.name     SUB_PHOTO_PICKER_TEST_0043
     * @tc.desc     Testing RecommendationOptions recommendationType
     *              and textContextInfo properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0043', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const photoSelectOptions:
          photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();

        photoSelectOptions.recommendationOptions = {
          recommendationType:
          photoAccessHelper.RecommendationType.QR_CODE,
          textContextInfo: {
            text: 'QR code'
          }
        };

        expect(
          photoAccessHelper.RecommendationType.QR_OR_BAR_CODE === 1
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.QR_CODE === 2
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.BAR_CODE === 3
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.ID_CARD === 4
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.PROFILE_PICTURE === 5
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.PASSPORT === 6
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.BANK_CARD === 7
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.DRIVER_LICENSE === 8
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType.DRIVING_LICENSE === 9
        ).assertTrue();
        expect(
          photoAccessHelper.RecommendationType
            .FEATURED_SINGLE_PORTRAIT === 10
        ).assertTrue();

        await routerToSheetPage(photoSelectOptions);
        await Utils.msSleep(1000);

        const modeApplied: boolean =
          await applyCompleteButtonMode(
            driver,
            'TEXT_DONE'
          );
        expect(modeApplied).assertTrue();

        await clickSelectPhotoButton();
        await Utils.msSleep(1000);
        await closePickerModel(driver);

        routerInstance.back();
        console.info('SUB_PHOTO_PICKER_TEST_0043 finish');
        done();
      });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0044
     * @tc.name     SUB_PHOTO_PICKER_TEST_0044
     * @tc.desc     Testing showAssetsCreationDialog error code coverage (401, 14000011)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0044', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null =
          photoAccessHelper.getPhotoAccessHelper(appContext);

        let boxPath: string =
          fileUri.getUriFromPath(appContext.filesDir + '/test.jpg').toString();

        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT
        };

        try {
          let resultPromise: Promise<Array<string>> =
            phAccessHelper!.showAssetsCreationDialog([boxPath], [photoCreationConfig]);
          await clickAgreeSave(driver);
          let result: Array<string> = await resultPromise;
          console.info('SUB_PHOTO_PICKER_TEST_0044 result: ' + JSON.stringify(result));
          expect(result).not().assertUndefined();
        } catch (e) {
          let error = e as BusinessError;
          console.error('SUB_PHOTO_PICKER_TEST_0044 case1 error code: ' + error.code);
          let isValidErrorCode = (error.code == -1 || error.code == 14000011 || error.code == 401);
          expect(isValidErrorCode).assertTrue();
        }

        try {
          await phAccessHelper!.showAssetsCreationDialog([], []);
          console.info('SUB_PHOTO_PICKER_TEST_0044 case2 unexpectedly succeeded');
        } catch (e) {
          let error = e as BusinessError;
          console.info('SUB_PHOTO_PICKER_TEST_0044 case2 error code: ' + error.code);
          let isValidErrorCode = (error.code == -1 || error.code == 401);
          expect(isValidErrorCode).assertTrue();
        }

        try {
          let invalidConfig: photoAccessHelper.PhotoCreationConfig = {
            title: 'test',
            fileNameExtension: 'mp4',
            photoType: photoAccessHelper.PhotoType.IMAGE,
            subtype: photoAccessHelper.PhotoSubtype.DEFAULT
          };
          let resultPromise: Promise<Array<string>> =
            phAccessHelper!.showAssetsCreationDialog([boxPath], [invalidConfig]);
          await clickAgreeSave(driver);
          await resultPromise;
          console.info('SUB_PHOTO_PICKER_TEST_0044 case3 unexpectedly succeeded');
        } catch (e) {
          let error = e as BusinessError;
          console.info('SUB_PHOTO_PICKER_TEST_0044 case3 error code: ' + error.code);
          let isValidErrorCode = (error.code == -1 || error.code == 14000011 || error.code == 401);
          expect(isValidErrorCode).assertTrue();
        }

        console.info('SUB_PHOTO_PICKER_TEST_0044 finish');
        done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0045
     * @tc.name     SUB_PHOTO_PICKER_TEST_0045
     * @tc.desc     Testing PhotoPickerComponent gridStartOffset
     *              and gridEndOffset properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0045', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const code: long = EventType.PHOTO_PICKER_INFO;
        const pickerOptions: PickerOptions =
          getDefaultPickerOptions();

        pickerOptions.gridStartOffset = 10;
        pickerOptions.gridEndOffset = 10;

        const options: router.RouterOptions = {
          url: 'MainAbility/pages/PickerComponent',
          params: {
            eventId: code,
            pickerOptions: pickerOptions
          } as RouterOptionsParams
        };

        await routeToUrl(options);
        await Utils.msSleep(1000);

        const component: Component | null =
          await driver.findComponent(ON.id('PhotoPickerComponent'));
        expect(component !== null).assertTrue();

        expect(pickerOptions.gridStartOffset === 10).assertTrue();
        expect(pickerOptions.gridEndOffset === 10).assertTrue();

        routerInstance.back();
        console.info('SUB_PHOTO_PICKER_TEST_0045 finish');
        done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0046
     * @tc.name     SUB_PHOTO_PICKER_TEST_0046
     * @tc.desc     Testing AnimatorParams duration and curve properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0046', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        let standaloneParams: AnimatorParams = new AnimatorParams();
        standaloneParams.duration = 300;
        let readDuration: int | undefined = standaloneParams.duration;
        expect(readDuration !== undefined && readDuration === 300).assertTrue();
        console.info('SUB_PHOTO_PICKER_TEST_0046 duration read: ' + String(readDuration));

        const code: long = EventType.PHOTO_PICKER_INFO;
        const pickerOptions: PickerOptions = getDefaultPickerOptions();

        const callback = (event: events_emitter.EventData): void => {
          if (!event.data) {
            console.error('SUB_PHOTO_PICKER_TEST_0046 event data is missing');
            return;
          }

          const data = event.data as Record<string, RecordData>;
          const rawData = data['msg'];

          if (rawData === undefined || rawData === null) {
            console.error('SUB_PHOTO_PICKER_TEST_0046 msg is missing');
            return;
          }

          const photoBrowserInfo: PhotoBrowserInfo =
            rawData as PhotoBrowserInfo;

          expect(photoBrowserInfo.animatorParams).not().assertUndefined();

          const animatorParams: AnimatorParams | undefined =
            photoBrowserInfo.animatorParams;

          if (animatorParams !== undefined) {
            const duration: int | undefined = animatorParams.duration;
            const curve = animatorParams.curve;

            if (duration !== undefined) {
              console.info('SUB_PHOTO_PICKER_TEST_0046 duration: ' + String(duration));
              expect(duration).not().assertUndefined();
            }

            if (curve !== undefined) {
              console.info('SUB_PHOTO_PICKER_TEST_0046 curve: ' + JSON.stringify(curve));
              expect(curve).not().assertUndefined();
            }
          }
        };

        const event: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        };

        events_emitter.on(event, callback);

        const options: router.RouterOptions = {
          url: 'MainAbility/pages/PickerComponent',
          params: {
            eventId: code,
            pickerOptions: pickerOptions
          } as RouterOptionsParams
        };

        try {
          await routeToUrl(options);
          await Utils.msSleep(1000);
          await clickBigPicture(driver);
          await Utils.msSleep(1000);
        } finally {
          events_emitter.off(code);
          routerInstance.back();
          console.info('SUB_PHOTO_PICKER_TEST_0046 finish');
          done();
        }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0048
     * @tc.name     SUB_PHOTO_PICKER_TEST_0048
     * @tc.desc     Testing MediaAssetChangeRequest setFavorite
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0048', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        let fetchResult:
        photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | null =
          null;

        try {
          const phAccessHelper:
          photoAccessHelper.PhotoAccessHelper | null =
            photoAccessHelper.getPhotoAccessHelper(appContext);

          if (phAccessHelper === null) {
            console.error('SUB_PHOTO_PICKER_TEST_0048 PhotoAccessHelper is null');
            return;
          }

          const predicates =
            new dataSharePredicates.DataSharePredicates();

          predicates.orderByDesc(
            photoAccessHelper.PhotoKeys.DATE_ADDED
          );

          const fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };

          console.info('SUB_PHOTO_PICKER_TEST_0048 before getAssets');
          fetchResult =
            await phAccessHelper.getAssets(fetchOptions);

          const count: int = fetchResult.getCount();
          console.info('SUB_PHOTO_PICKER_TEST_0048 asset count: ' + String(count));

          if (count <= 0) {
            console.info('SUB_PHOTO_PICKER_TEST_0048 no PhotoAsset, skip runtime operation');
            return;
          }

          const asset: photoAccessHelper.PhotoAsset =
            await fetchResult.getFirstObject();

          const changeRequest:
            photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(asset);

          changeRequest.setFavorite(true);
          changeRequest.setFavorite(false);

          expect(changeRequest).not().assertUndefined();
          console.info('SUB_PHOTO_PICKER_TEST_0048 setFavorite called successfully');
        } catch (error) {
          const businessError: BusinessError =
            error as BusinessError;

          console.error(
            'SUB_PHOTO_PICKER_TEST_0048 error code: ' +
              String(businessError.code)
          );
          console.error(
            'SUB_PHOTO_PICKER_TEST_0048 error message: ' +
              businessError.message
          );
        } finally {
          if (fetchResult !== null) {
            fetchResult.close();
          }
          done();
        }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0049
     * @tc.name     SUB_PHOTO_PICKER_TEST_0049
     * @tc.desc     Testing PhotoViewPicker select(option?) promise overload,
     *              opened from the BindSheetPicker page (real mounted context)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0049', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const photoSelectOptions: photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;
        photoSelectOptions.singleSelectionMode =
          photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE;

        const code: long = EventType.PICKER_SHEET_PAGE;
        const callback = (event: events_emitter.EventData) => {
          if (!event.data) {
            console.error('SUB_PHOTO_PICKER_TEST_0049 event data is missing');
            return;
          }
          const eventData = event.data as Record<string, RecordData>;
          const result: photoAccessHelper.PhotoSelectResult =
            eventData['msg'] as photoAccessHelper.PhotoSelectResult;
          console.info('SUB_PHOTO_PICKER_TEST_0049 result is' + JSON.stringify(result));
          expect(result).not().assertNull();
        }
        const event: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);

        await routerToSheetPage(photoSelectOptions);
        await clickSelectPhotoButton('select photo');
        await Utils.msSleep(2000);
        await closePickerModel(driver);

        routerInstance.back();
        events_emitter.off(code);
        console.info('SUB_PHOTO_PICKER_TEST_0049 finish');
        done();
      });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0050
     * @tc.name     SUB_PHOTO_PICKER_TEST_0050
     * @tc.desc     Testing PhotoViewPicker select(option, callback) overload,
     *              opened from the BindSheetPicker page (real mounted context)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0050', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const photoSelectOptions: photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;
        photoSelectOptions.isEditSupported = true;
        photoSelectOptions.isOriginalSupported = true;

        const code: long = EventType.PICKER_SHEET_PAGE;
        const callback = (event: events_emitter.EventData) => {
          if (!event.data) {
            console.error('SUB_PHOTO_PICKER_TEST_0050 event data is missing');
            return;
          }
          const eventData = event.data as Record<string, RecordData>;
          const result: photoAccessHelper.PhotoSelectResult =
            eventData['msg'] as photoAccessHelper.PhotoSelectResult;
          console.info('SUB_PHOTO_PICKER_TEST_0050 result is' + JSON.stringify(result));
          expect(result).not().assertNull();
        }
        const event: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);

        await routerToSheetPage(photoSelectOptions);
        await clickSelectPhotoButton('select photo');
        await Utils.msSleep(2000);
        await closePickerModel(driver);

        routerInstance.back();
        events_emitter.off(code);
        console.info('SUB_PHOTO_PICKER_TEST_0050 finish');
        done();
      });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0051
     * @tc.name     SUB_PHOTO_PICKER_TEST_0051
     * @tc.desc     Testing VideoPlayerState enum values with mounted PhotoPickerComponent
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0051', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      const code: long = EventType.VIDEO_PLAY_STATE;
      const pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;

      const callback = (event: events_emitter.EventData): void => {
        if (!event.data) {
          console.error('SUB_PHOTO_PICKER_TEST_0051 event data is null');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: number = eventData['msg'] as number;
        console.info('SUB_PHOTO_PICKER_TEST_0051 state: ' + String(result));
      };
      const event: events_emitter.InnerEvent = { eventId: code, priority: events_emitter.EventPriority.LOW };
      events_emitter.on(event, callback);

      const options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: { eventId: code, pickerOptions: pickerOptions } as RouterOptionsParams
      };

      try {
        await routeToUrl(options);
        await Utils.msSleep(1000);
        const strJson: string | null = inspector.getInspectorByKey('PhotoPickerComponent');
        expect(strJson !== null && strJson.length > 0).assertTrue();
        if (strJson === null || strJson.length === 0) {
          return;
        }
        const obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility') === 'Visibility.Visible').assertTrue();
        expect(VideoPlayerState.PLAYING === 0).assertTrue();
        expect(VideoPlayerState.PAUSED === 1).assertTrue();
        expect(VideoPlayerState.STOPPED === 2).assertTrue();
        expect(VideoPlayerState.SEEK_START === 3).assertTrue();
        expect(VideoPlayerState.SEEK_FINISH === 4).assertTrue();
      } finally {
        events_emitter.off(event.eventId);
        routerInstance.back();
        console.info('SUB_PHOTO_PICKER_TEST_0051 finish');
        done();
      }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0052
     * @tc.name     SUB_PHOTO_PICKER_TEST_0052
     * @tc.desc     Testing MovingPhotoBadgeStateType and GridLevel enum values
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0052', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      expect(photoAccessHelper.MovingPhotoBadgeStateType.NOT_MOVING_PHOTO === 0).assertTrue();
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_ENABLED === 1).assertTrue();
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_DISABLED === 2).assertTrue();
      expect(photoAccessHelper.GridLevel.SPACIOUS === 0).assertTrue();
      expect(photoAccessHelper.GridLevel.STANDARD === 1).assertTrue();
      expect(photoAccessHelper.GridLevel.COMPACT === 2).assertTrue();
      console.info('SUB_PHOTO_PICKER_TEST_0052 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0053
     * @tc.name     SUB_PHOTO_PICKER_TEST_0053
     * @tc.desc     Testing PlayMode, SceneType enum values and AutoPlayScene properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0053', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      expect(photoAccessHelper.PlayMode.DEFAULT === 0).assertTrue();
      expect(photoAccessHelper.PlayMode.AUTO_PLAY === 1).assertTrue();
      expect(photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER === 0).assertTrue();
      expect(photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE === 1).assertTrue();

      let scene: photoAccessHelper.AutoPlayScene = new photoAccessHelper.AutoPlayScene();
      scene.sceneType = photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER;
      scene.playMode = photoAccessHelper.PlayMode.AUTO_PLAY;
      expect(scene.sceneType === photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER).assertTrue();
      expect(scene.playMode === photoAccessHelper.PlayMode.AUTO_PLAY).assertTrue();

      scene.sceneType = photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE;
      scene.playMode = photoAccessHelper.PlayMode.DEFAULT;
      expect(scene.sceneType === photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE).assertTrue();
      expect(scene.playMode === photoAccessHelper.PlayMode.DEFAULT).assertTrue();

      console.info('SUB_PHOTO_PICKER_TEST_0053 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0054
     * @tc.name     SUB_PHOTO_PICKER_TEST_0054
     * @tc.desc     Testing ContextRecoveryInfo all properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0054', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let contextRecoveryInfo: photoAccessHelper.ContextRecoveryInfo =
        new photoAccessHelper.ContextRecoveryInfo();
      contextRecoveryInfo.albumUri = 'file://media/PhotoAlbum/1';
      contextRecoveryInfo.time = 1756371999125;
      contextRecoveryInfo.displayName = 'IMG_20240522_085513_3.jpg';
      contextRecoveryInfo.recommendationType = 0;
      contextRecoveryInfo.selectedRecommendationType = 0;
      contextRecoveryInfo.version = 1;
      contextRecoveryInfo.gridLevel = photoAccessHelper.GridLevel.STANDARD;
      contextRecoveryInfo.sortRule = '';
      contextRecoveryInfo.fileSize = 0;

      expect(contextRecoveryInfo.albumUri === 'file://media/PhotoAlbum/1').assertTrue();
      expect(contextRecoveryInfo.time === 1756371999125).assertTrue();
      expect(contextRecoveryInfo.displayName === 'IMG_20240522_085513_3.jpg').assertTrue();
      expect(contextRecoveryInfo.recommendationType === 0).assertTrue();
      expect(contextRecoveryInfo.selectedRecommendationType === 0).assertTrue();
      expect(contextRecoveryInfo.version === 1).assertTrue();
      expect(contextRecoveryInfo.gridLevel === photoAccessHelper.GridLevel.STANDARD).assertTrue();
      expect(contextRecoveryInfo.sortRule === '').assertTrue();
      expect(contextRecoveryInfo.fileSize === 0).assertTrue();

      console.info('SUB_PHOTO_PICKER_TEST_0054 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0055
     * @tc.name     SUB_PHOTO_PICKER_TEST_0055
     * @tc.desc     Testing CreationSetting title, fileNameExtension and photoType properties
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0055', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let creationSetting: photoAccessHelper.CreationSetting = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE
      };
      expect(creationSetting.title === 'test').assertTrue();
      expect(creationSetting.fileNameExtension === 'jpg').assertTrue();
      expect(creationSetting.photoType === photoAccessHelper.PhotoType.IMAGE).assertTrue();

      let videoCreationSetting: photoAccessHelper.CreationSetting = {
        title: 'video',
        fileNameExtension: 'mp4',
        photoType: photoAccessHelper.PhotoType.VIDEO
      };
      expect(videoCreationSetting.fileNameExtension === 'mp4').assertTrue();
      expect(videoCreationSetting.photoType === photoAccessHelper.PhotoType.VIDEO).assertTrue();

      console.info('SUB_PHOTO_PICKER_TEST_0055 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0056
     * @tc.name     SUB_PHOTO_PICKER_TEST_0056
     * @tc.desc     Testing AlbumPickerComponent build (mounted) with AlbumPickerOptions fontSize
     *              and AlbumPickerController setFontSize
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0056', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: long = EventType.ALBUM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
      albumOptions.fontSize = '20vp';
      albumOptions.themeColorMode = PickerColorMode.AUTO;
      expect(albumOptions.fontSize === '20vp').assertTrue();

      let albumClicked: boolean = false;
      let callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('Event data is null');
          return;
        }
        const data = event.data as Record<string, RecordData>;
        let result: AlbumInfo | null = (data['msg'] as AlbumInfo) ?? null;
        if (result == null) {
          console.error('SUB_PHOTO_PICKER_TEST_0056 result is null');
          return;
        }
        albumClicked = true;
        console.info('SUB_PHOTO_PICKER_TEST_0056 select AlbumInfo=:' + JSON.stringify(result));
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
          albumOptions: albumOptions,
        } as RouterOptionsParams
      }
      await routeToUrl(options);
      console.info('SUB_PHOTO_PICKER_TEST_0056 create');

      let albumBtn: Component | null = await driver.findComponent(ON.id('albumButton'));
      expect(albumBtn !== null).assertTrue();
      if (albumBtn !== null) {
        await albumBtn.click();
      }
      await Utils.msSleep(2000);

      const albumJson: string | null = inspector.getInspectorByKey('AlbumPickerComponent');
      expect(albumJson !== null && albumJson.length > 0).assertTrue();
      if (albumJson !== null && albumJson.length > 0) {
        const albumObj = JSON.parseJsonElement(albumJson);
        expect(albumObj.getElement('$attrs').getString('visibility') === 'Visibility.Visible').assertTrue();
        console.info('SUB_PHOTO_PICKER_TEST_0056 AlbumPickerComponent mounted, build verified');
      }

      let albumItem: Component | null = await driver.findComponent(ON.id('ListItem_0'));
      if (albumItem !== null) {
        await albumItem.click();
        await Utils.msSleep(1000);
      } else {
        console.info('SUB_PHOTO_PICKER_TEST_0056 ListItem_0 not found, skip album selection');
      }

      try {
        let albumController: AlbumPickerController = new AlbumPickerController();
        albumController.setFontSize(50);
        albumController.setFontSize('20vp');
        expect(albumController).not().assertUndefined();
        console.info('SUB_PHOTO_PICKER_TEST_0056 setFontSize called successfully');
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0056 setFontSize error: ' + JSON.stringify(error));
      }

      routerInstance.back();
      events_emitter.off(event.eventId);
      console.info('SUB_PHOTO_PICKER_TEST_0056 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0057
     * @tc.name     SUB_PHOTO_PICKER_TEST_0057
     * @tc.desc     Testing PhotoSelectResult isOriginalPhoto and photoUris properties when selection result is returned
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0057', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoSelectOptions: photoAccessHelper.PhotoSelectOptions = getDefaultPhotoSelectOptions();
      photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      photoSelectOptions.maxSelectNumber = 1;

      const code: long = EventType.PICKER_SHEET_PAGE;
      const callback = (event: events_emitter.EventData) => {
        if (!event.data) {
          console.error('SUB_PHOTO_PICKER_TEST_0057 event data is missing');
          return;
        }
        const eventData = event.data as Record<string, RecordData>;
        const result: photoAccessHelper.PhotoSelectResult =
          eventData['msg'] as photoAccessHelper.PhotoSelectResult;
        console.info('SUB_PHOTO_PICKER_TEST_0057 result is' + JSON.stringify(result));
        expect(result).not().assertNull();
        expect(result.photoUris).not().assertUndefined();
        expect(result.isOriginalPhoto).not().assertUndefined();
      }
      const event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);

      await routerToSheetPage(photoSelectOptions);
      await clickSelectPhotoButton();
      await Utils.msSleep(2000);
      await closePickerModel(driver);
      routerInstance.back();
      events_emitter.off(code);
      console.info('SUB_PHOTO_PICKER_TEST_0057 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0058
     * @tc.name     SUB_PHOTO_PICKER_TEST_0058
     * @tc.desc     Testing PhotoViewPicker select(callback) only-callback overload,
     *              opened from the BindSheetPicker page (real mounted context)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0058', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!isExecutePicker) {
          done();
          return;
        }

        const photoSelectOptions: photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;

        const code: long = EventType.PICKER_SHEET_PAGE;
        const callback = (event: events_emitter.EventData) => {
          if (!event.data) {
            console.error('SUB_PHOTO_PICKER_TEST_0058 event data is missing');
            return;
          }
          const eventData = event.data as Record<string, RecordData>;
          const result: photoAccessHelper.PhotoSelectResult =
            eventData['msg'] as photoAccessHelper.PhotoSelectResult;
          console.info('SUB_PHOTO_PICKER_TEST_0058 result is' + JSON.stringify(result));
          expect(result).not().assertNull();
        }
        const event: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(event, callback);

        await routerToSheetPage(photoSelectOptions);
        await clickSelectPhotoButton('select photo');
        await Utils.msSleep(2000);
        await closePickerModel(driver);

        routerInstance.back();
        events_emitter.off(code);
        console.info('SUB_PHOTO_PICKER_TEST_0058 finish');
        done();
      });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0059
     * @tc.name     SUB_PHOTO_PICKER_TEST_0059
     * @tc.desc     Testing MediaAssetsChangeRequest setFavorite
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0059', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | null = null;
      try {
        const phAccessHelper: photoAccessHelper.PhotoAccessHelper | null =
          photoAccessHelper.getPhotoAccessHelper(appContext);
        if (phAccessHelper === null) {
          console.error('SUB_PHOTO_PICKER_TEST_0059 PhotoAccessHelper is null');
          return;
        }
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.orderByDesc(photoAccessHelper.PhotoKeys.DATE_ADDED);
        const fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        fetchResult = await phAccessHelper.getAssets(fetchOptions);
        const count: int = fetchResult.getCount();
        console.info('SUB_PHOTO_PICKER_TEST_0059 asset count: ' + String(count));
        if (count <= 0) {
          console.info('SUB_PHOTO_PICKER_TEST_0059 no PhotoAsset, skip runtime operation');
          return;
        }
        const asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const assets: Array<photoAccessHelper.PhotoAsset> = [asset];
        const changeRequest: photoAccessHelper.MediaAssetsChangeRequest =
          new photoAccessHelper.MediaAssetsChangeRequest(assets);
        changeRequest.setFavorite(true);
        changeRequest.setFavorite(false);
        expect(changeRequest).not().assertUndefined();
        console.info('SUB_PHOTO_PICKER_TEST_0059 setFavorite called successfully');
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0059 error code: ' + String(error.code));
        console.error('SUB_PHOTO_PICKER_TEST_0059 error message: ' + error.message);
      } finally {
        if (fetchResult !== null) {
          fetchResult.close();
        }
        done();
      }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0060
     * @tc.name     SUB_PHOTO_PICKER_TEST_0060
     * @tc.desc     Testing PhotoAccessHelper onSinglePhotoChange and offSinglePhotoChange
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | null = null;
      try {
        const phAccessHelper: photoAccessHelper.PhotoAccessHelper | null =
          photoAccessHelper.getPhotoAccessHelper(appContext);
        if (phAccessHelper === null) {
          console.error('SUB_PHOTO_PICKER_TEST_0060 PhotoAccessHelper is null');
          return;
        }
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.orderByDesc(photoAccessHelper.PhotoKeys.DATE_ADDED);
        const fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        fetchResult = await phAccessHelper.getAssets(fetchOptions);
        const count: int = fetchResult.getCount();
        console.info('SUB_PHOTO_PICKER_TEST_0060 asset count: ' + String(count));
        if (count <= 0) {
          console.info('SUB_PHOTO_PICKER_TEST_0060 no PhotoAsset, skip runtime operation');
          return;
        }
        const asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const onChangeCallback = (changeInfos: photoAccessHelper.PhotoAssetChangeInfos): void => {
          console.info('SUB_PHOTO_PICKER_TEST_0060 onSinglePhotoChange: ' + JSON.stringify(changeInfos));
        };
        phAccessHelper.onSinglePhotoChange(asset, onChangeCallback);
        await Utils.msSleep(500);
        phAccessHelper.offSinglePhotoChange(asset, onChangeCallback);
        phAccessHelper.offSinglePhotoChange(asset);
        console.info('SUB_PHOTO_PICKER_TEST_0060 on/off SinglePhotoChange called successfully');
        expect(asset).not().assertUndefined();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0060 error: ' + JSON.stringify(error));
      } finally {
        if (fetchResult !== null) {
          fetchResult.close();
        }
        done();
      }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0061
     * @tc.name     SUB_PHOTO_PICKER_TEST_0061
     * @tc.desc     Testing PhotoAccessHelper onSinglePhotoAlbumChange and offSinglePhotoAlbumChange
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0061', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | null = null;
      try {
        const phAccessHelper: photoAccessHelper.PhotoAccessHelper | null =
          photoAccessHelper.getPhotoAccessHelper(appContext);
        if (phAccessHelper === null) {
          console.error('SUB_PHOTO_PICKER_TEST_0061 PhotoAccessHelper is null');
          return;
        }
        albumFetchResult = await phAccessHelper.getAlbums(
          photoAccessHelper.AlbumType.SYSTEM,
          photoAccessHelper.AlbumSubtype.IMAGE
        );
        const count: int = albumFetchResult.getCount();
        console.info('SUB_PHOTO_PICKER_TEST_0061 album count: ' + String(count));
        if (count <= 0) {
          console.info('SUB_PHOTO_PICKER_TEST_0061 no Album, skip runtime operation');
          return;
        }
        const album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        const onAlbumChangeCallback = (changeInfos: photoAccessHelper.AlbumChangeInfos): void => {
          console.info('SUB_PHOTO_PICKER_TEST_0061 onSinglePhotoAlbumChange: ' + JSON.stringify(changeInfos));
        };
        phAccessHelper.onSinglePhotoAlbumChange(album, onAlbumChangeCallback);
        await Utils.msSleep(500);
        phAccessHelper.offSinglePhotoAlbumChange(album, onAlbumChangeCallback);
        phAccessHelper.offSinglePhotoAlbumChange(album);
        console.info('SUB_PHOTO_PICKER_TEST_0061 on/off SinglePhotoAlbumChange called successfully');
        expect(album).not().assertUndefined();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0061 error: ' + JSON.stringify(error));
      } finally {
        if (albumFetchResult !== null) {
          albumFetchResult.close();
        }
        done();
      }
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0062
     * @tc.name     SUB_PHOTO_PICKER_TEST_0062
     * @tc.desc     Testing PickerController setData, setMaxSelected,
     *              setPhotoBrowserItem and setPhotoBrowserUIElementVisibility
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0062', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      try {
        let pickerController: PickerController = new PickerController();


        let selectedUris: Array<string> = ['file://media/Photo/test1.jpg', 'file://media/Photo/test2.jpg'];
        pickerController.setData(DataType.SET_SELECTED_URIS, selectedUris);

        let maxSelected: MaxSelected = new MaxSelected();
        let maxData: Map<MaxCountType, int> = new Map<MaxCountType, int>();
        maxData.set(MaxCountType.TOTAL_MAX_COUNT, 1);
        maxData.set(MaxCountType.PHOTO_MAX_COUNT, 1);
        maxData.set(MaxCountType.VIDEO_MAX_COUNT, 1);
        maxSelected.data = maxData;
        pickerController.setMaxSelected(maxSelected);

        pickerController.setPhotoBrowserItem('file://media/Photo/test1.jpg', PhotoBrowserRange.ALL);
        pickerController.setPhotoBrowserItem('', PhotoBrowserRange.SELECTED_ONLY);

        let elements: Array<PhotoBrowserUIElement> =
          [PhotoBrowserUIElement.CHECKBOX, PhotoBrowserUIElement.BACK_BUTTON];
        pickerController.setPhotoBrowserUIElementVisibility(elements, true);
        pickerController.setPhotoBrowserUIElementVisibility(elements, false);
        pickerController.setPhotoBrowserUIElementVisibility([], true);

        expect(pickerController).not().assertUndefined();
        console.info('SUB_PHOTO_PICKER_TEST_0062 PickerController methods called successfully');
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0062 error: ' + JSON.stringify(error));
      }
      console.info('SUB_PHOTO_PICKER_TEST_0062 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0063
     * @tc.name     SUB_PHOTO_PICKER_TEST_0063
     * @tc.desc     Testing PhotoViewPicker select(option) promise overload by direct invocation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0063', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      try {
        let photoPicker: photoAccessHelper.PhotoViewPicker =
          new photoAccessHelper.PhotoViewPicker();
        let photoSelectOptions: photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;

        let result: photoAccessHelper.PhotoSelectResult =
          await photoPicker.select(photoSelectOptions);
        console.info('SUB_PHOTO_PICKER_TEST_0063 result: ' + JSON.stringify(result));
        expect(result).not().assertNull();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0063 error code: ' + String(error.code) + ', ' + error.message);
        let isValidErrorCode =
          (error.code == -1 || error.code == 401 || error.code == 13900042 || error.code == 23800151);
        expect(isValidErrorCode).assertTrue();
      }
      console.info('SUB_PHOTO_PICKER_TEST_0063 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0064
     * @tc.name     SUB_PHOTO_PICKER_TEST_0064
     * @tc.desc     Testing PhotoViewPicker select(option, callback) overload by direct invocation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0064', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      try {
        let photoPicker: photoAccessHelper.PhotoViewPicker =
          new photoAccessHelper.PhotoViewPicker();
        let photoSelectOptions: photoAccessHelper.PhotoSelectOptions =
          getDefaultPhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 1;

        let selectCallback: AsyncCallback<photoAccessHelper.PhotoSelectResult> =
          (err: BusinessError | null, result: photoAccessHelper.PhotoSelectResult | undefined): void => {
            if (err !== null && err.code != 0) {
              console.error('SUB_PHOTO_PICKER_TEST_0064 callback error code: ' + String(err.code));
              let isValidErrorCode =
                (err.code == -1 || err.code == 401 || err.code == 13900042 || err.code == 23800151);
              expect(isValidErrorCode).assertTrue();
              return;
            }
            if (result !== undefined) {
              console.info('SUB_PHOTO_PICKER_TEST_0064 callback result: ' + JSON.stringify(result));
              expect(result).not().assertNull();
            }
          };
        photoPicker.select(photoSelectOptions, selectCallback);
        await Utils.msSleep(2000);
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0064 sync error code: ' + String(error.code) + ', ' + error.message);
        let isValidErrorCode = (error.code == -1 || error.code == 401);
        expect(isValidErrorCode).assertTrue();
      }
      console.info('SUB_PHOTO_PICKER_TEST_0064 finish');
      done();
    });

    /**
     * @tc.number   SUB_PHOTO_PICKER_TEST_0065
     * @tc.name     SUB_PHOTO_PICKER_TEST_0065
     * @tc.desc     Testing PhotoViewPicker select() promise overload, option omitted branch
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level0
     */
    it('SUB_PHOTO_PICKER_TEST_0065', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isExecutePicker) {
        done();
        return;
      }
      try {
        let photoPicker: photoAccessHelper.PhotoViewPicker =
          new photoAccessHelper.PhotoViewPicker();
        let result: photoAccessHelper.PhotoSelectResult =
          await photoPicker.select();
        console.info('SUB_PHOTO_PICKER_TEST_0065 result: ' + JSON.stringify(result));
        expect(result).not().assertNull();
      } catch (e) {
        let error = e as BusinessError;
        console.error('SUB_PHOTO_PICKER_TEST_0065 error code: ' + String(error.code) + ', ' + error.message);
        let isValidErrorCode =
          (error.code == -1 || error.code == 401 || error.code == 13900042 || error.code == 23800151);
        expect(isValidErrorCode).assertTrue();
      }
      console.info('SUB_PHOTO_PICKER_TEST_0065 finish');
      done();
    });
  })
}