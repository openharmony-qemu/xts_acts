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

import { BaseItemInfo } from '@ohos.file.PhotoPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import {
  RecentPhotoOptions,
  PhotoSource,
  RecentPhotoComponent,
  RecentPhotoClickCallback,
  RecentPhotoCheckResultCallback,
  RecentPhotoCheckInfoCallback,
  RecentPhotoInfo,
} from '@ohos.file.RecentPhotoComponent';
import events_emitter from '@ohos.events.emitter';
import { Router } from '@ohos.arkui.UIContext'
import { EventType } from '../common/Common';
import { Entry, Component, Column, Button, FlexAlign, HorizontalAlign } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { RouterRecentPhotoOptions } from '../common/Common'
import { RecordData } from '@ohos.base'

@Entry
@Component
struct RecentPhotoDemo {
  private recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
  private recentPhotoClickCallback: RecentPhotoClickCallback =
    (recentPhotoInfo: BaseItemInfo): boolean => this.onRecentPhotoClick(recentPhotoInfo);
  private checkResultCallback: RecentPhotoCheckResultCallback =
    (recentPhotoExists: boolean) => this.onRecentPhotoCheckResult(recentPhotoExists);
  private checkInfoCallback: RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean,
    info: RecentPhotoInfo): void => this.onCheckInfoCallback(recentPhotoExists, info);
  private eventId: number = 0;

  sendEvent(message: Object, eventId: long) {
    let eventData: events_emitter.EventData = {
      data: {
        'msg': message,
      } as Record<String, RecordData>
    }

    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  aboutToAppear() {
    let router: Router = AppStorage.get<Router>('router') as Router;
    let parameter: RouterRecentPhotoOptions = router.getParams() as RouterRecentPhotoOptions;
    if (parameter.eventId != undefined) {
      this.eventId = parameter.eventId;
    }
    if (parameter.recentPhotoOptions != undefined) {
      this.recentPhotoOptions = parameter.recentPhotoOptions;
    }
    console.info('eventId=' + this.eventId);
  }

  private onRecentPhotoCheckResult(recentPhotoExists: boolean): void {
    console.info('Check photo, recentPhotoExists = ' + recentPhotoExists);
  }

  private onRecentPhotoClick(recentPhotoInfo: BaseItemInfo): boolean {
    this.sendEvent(recentPhotoInfo, EventType.RECENT_PHOTO_INFO);
    console.info('onRecentPhotoClick  recentPhotoInfo = ' + JSON.stringify(recentPhotoInfo));
    return true;
  }

  private onCheckInfoCallback(recentPhotoExists: boolean, info: RecentPhotoInfo): void {
    console.info('onCheckInfoCallback recentPhotoInfo dateToken ' + info.dateTaken);
    console.info('onCheckInfoCallback recentPhotoInfo identifier ' + info.identifier);
  }

  build() {
    Column() {
      Column() {
        RecentPhotoComponent({
          recentPhotoOptions: this.recentPhotoOptions,
          onRecentPhotoCheckResult: this.checkResultCallback,
          onRecentPhotoClick: this.recentPhotoClickCallback,
          onRecentPhotoCheckInfo: this.checkInfoCallback,
        })
      }
      .height('50vp')
      .width('50vp')
      .id('recentPhoto')
    }.height('100%').width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}