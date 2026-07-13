'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base';
import { Entry, Component, Column, Button, Margin, Padding, ClickEvent } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Context from 'application.Context';
import { RouterSelectOptionsParams, EventType } from '../common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';

const topMargin: number = 20;

@Entry
@Component
struct BindSheetPicker {
  private photoSelectOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();

  private photoPicker: photoAccessHelper.PhotoViewPicker = new photoAccessHelper.PhotoViewPicker();

  initPhotoAccessHelper(): void {
    let isInit: boolean = AppStorage.get<boolean>('isBindSheetPickerInit') as boolean;
    if (isInit) {
      return;
    }
    console.info('initPhotoAccessHelper is called')
    try {
      let context: Context =  AppStorage.get<Context>('Context') as Context;
      photoAccessHelper.getPhotoAccessHelper(context);
      AppStorage.setOrCreate<boolean>('isBindSheetPickerInit', true);
    } catch (err) {
      console.error('initPhotoAccessHelper failed, err is: ' + JSON.stringify(err));
    }
  }

  aboutToAppear() {
    this.initPhotoAccessHelper();
    const router: Router = AppStorage.get<Router>('router') as Router;
    const parameter = router.getParams() as RouterSelectOptionsParams;
    this.photoSelectOptions = parameter?.photoSelectOptions;
  }

  sendEvent(message: Object, eventId: long) {
    const eventData: events_emitter.EventData = {
      data: {
        'msg': message,
      }  as Record<String, RecordData>
    }

    const event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  build() {
    Column() {
      Button('TEXT_DONE')
        .onClick((e: ClickEvent) => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_DONE;
        })
        .margin ({ top: topMargin } as Margin).id('TEXT_DONE')
      Button('TEXT_SEND')
        .onClick((e: ClickEvent) => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_SEND;
        })
        .margin({ top: topMargin } as Margin).id('TEXT_SEND')
      Button('TEXT_ADD')
        .onClick((e: ClickEvent) => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_ADD;
        })
        .margin({ top: topMargin } as Margin).id('TEXT_ADD')
      Button('select photo')
        .width(150)
        .margin({ top: topMargin } as Margin).id('select photo')
        .onClick((e: ClickEvent) => {
          console.info('BindSheetPicker select photo is called');
          this.photoPicker.select(this.photoSelectOptions)
            .then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
              console.info('PhotoViewPicker.select success, PhotoPickerResult uri: ' +
              JSON.stringify(photoSelectResult));
              this.sendEvent(photoSelectResult, EventType.PICKER_SHEET_PAGE);
            }).catch((err: Error) => {
            console.error('PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
          });
        })
    }.padding({ top: 20, right: 20, bottom: 20, left: 20 } as Padding)
  }
}