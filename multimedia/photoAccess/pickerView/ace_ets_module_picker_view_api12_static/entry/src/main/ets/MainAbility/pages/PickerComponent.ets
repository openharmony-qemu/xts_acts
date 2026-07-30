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

import {
  PhotoPickerComponent,
  PickerController,
  PickerOptions,
  DataType,
  ItemInfo,
  ItemType,
  PhotoBrowserInfo,
  ClickType,
  PickerColorMode,
  ReminderMode,
  MaxSelected,
  MaxCountType,
  BaseItemInfo,
  PhotoBrowserRange,
  PhotoBrowserUIElement,
  ItemsDeletedCallback,
  ExceedMaxSelectedCallback,
  CurrentAlbumDeletedCallback,
  VideoPlayStateChangedCallback,
  VideoPlayerState,
  SelectMode
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import events_emitter from '@ohos.events.emitter';
import { Router } from '@ohos.arkui.UIContext';
import { EventType } from '../common/Common';
import { PhotoPickerResult } from '../common/PhotoPickerResult';
import { Entry, Component, Column, Button, TabsController, Builder, Text, Divider, Row,
  Stack, ForEach, Offset, Margin, Image, Position, Visibility, ClickEvent } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { RouterOptionsParams } from '../common/Common'
import { RecordData } from '@ohos.base'

@Entry
@Component
struct PickerComponent {
  @State pickerController: PickerController = new PickerController();
  @State pickerOptions: PickerOptions = new PickerOptions();
  albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
  @State selectedUris: string[] = [] as string[];
  @State allBackGroundColor: int = 0xf1f3f5;
  @State videoBackGroundColor: int = 0xffffff;
  @State photoBackGroundColor: int = 0xffffff;
  @State isShowAll: boolean = true;
  @State isShowVideo: boolean = false;
  @State isShowPhoto: boolean = false;
  @State isShowAlbum: boolean = false;
  private isBlock: boolean = false;
  @State isPhotoPickerShow: boolean = true;
  @State fontColor: string = '#182431222';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: int = 0;
  private controller: TabsController = new TabsController();
  private eventId: long = 0;
  // 控制缩略图是否显示
  @State private isBrowserShow: boolean = false;
  @State videoCallBackState: VideoPlayerState = VideoPlayerState.PLAYING;

  private selectedItemsDeletedCallback: ItemsDeletedCallback =
    (baseItemInfos: Array<BaseItemInfo>) => this.onSelectedItemsDeleted(baseItemInfos);
  private exceedMaxSeletedCallback: ExceedMaxSelectedCallback =
    (exceedMaxCountType: MaxCountType) => this.onExceedMaxSelected(exceedMaxCountType);
  private currentAlbumDeletedCallback: CurrentAlbumDeletedCallback = () => this.onCurrentAlbumDeleted();
  private videoPlayStateChangedCallback: VideoPlayStateChangedCallback =
    (state: VideoPlayerState) => this.onVideoPlayStateChanged(state);

  sendEvent(message: Object, eventId: long) {
    let eventData: events_emitter.EventData = {
      data: {
        'msg': message,
      }  as Record<String, RecordData>
    }

    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  getPhotoPickerResult(): PhotoPickerResult {
    let result: PhotoPickerResult = new PhotoPickerResult();
    result.checkBoxColor = this.pickerOptions.checkBoxColor ?? '';
    result.backgroundColor = this.pickerOptions.backgroundColor ?? '';
    result.isRepeatSelectSupported = this.pickerOptions.isRepeatSelectSupported ?? false;
    result.photoBrowserBackgroundColorMode = this.pickerOptions.photoBrowserBackgroundColorMode ?? PickerColorMode.AUTO;
    result.maxSelectedReminderMode = this.pickerOptions.maxSelectedReminderMode ?? ReminderMode.NONE;
    result.checkboxTextColor = this.pickerOptions.checkboxTextColor ?? '';
    result.selectMode = this.pickerOptions.selectMode ?? SelectMode.SINGLE_SELECT;
    result.maxSelectCount = this.pickerOptions.maxSelectNumber ?? 500;
    result.maxPhotoSelectNumber = this.pickerOptions.maxPhotoSelectNumber ?? 500;
    result.maxVideoSelectNumber = this.pickerOptions.maxVideoSelectNumber ?? 500;
    result.preselectedUris = this.pickerOptions.preselectedUris ?? [];
    result.isPreviewForSingleSelectionSupported =
      this.pickerOptions.isPreviewForSingleSelectionSupported ?? false;
    return result;
  }

  private onEnterPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    this.sendEvent(photoBrowserInfo, this.eventId);
    console.info('onEnterPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  private onExitPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    console.info('onExitPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  // 大图页图片切换回调事件处理
  private onPhotoBrowserChanged(photoBrowserItemInfo: BaseItemInfo): boolean{
    console.log('onPhotoBrowserChanged, item = ' + JSON.stringify(photoBrowserItemInfo));
    return true;
  }

  private onPickerControllerReady(): void {
    console.info('onPickerControllerReady');
    this.pickerController.setPhotoBrowserUIElementVisibility([PhotoBrowserUIElement.CHECKBOX,
      PhotoBrowserUIElement.BACK_BUTTON], true);
  }

  private onSelectedItemsDeleted(baseItemInfos: Array<BaseItemInfo>): void {
    console.info('onSelectedItemsDeleted');
    // 已勾选图片被删除时的回调
  }

  private onExceedMaxSelected(exceedMaxCountType: MaxCountType): void {
    console.info('onExceedMaxSelected');
    // 超过最大选择数量再次点击时的回调
  }

  private onCurrentAlbumDeleted(): void {
    console.info('onCurrentAlbumDeleted');
    // 当前相册被删除时的回调
  }

  private onVideoPlayStateChanged(state: VideoPlayerState): void {
    console.info('onVideoPlayStateChanged', state)
    this.videoCallBackState = state;
  }

  private onAlbumClick(albumInfo: AlbumInfo): boolean {
    const albumName: string = albumInfo.albumName ?? '';
    console.info('onAlbumClick albumName: ' + albumName);
    this.isShowAlbum = false;
    console.info('onAlbumClick' + JSON.stringify(albumInfo?.uri));
    this.sendEvent(albumInfo, EventType.ALBUM_INFO);
    if (albumInfo?.uri) {
      this.pickerController.setData(DataType.SET_ALBUM_URI, albumInfo.uri!);
      console.info('onALbumClick' + JSON.stringify(albumInfo.uri));
    }
    return true;
  }

  private onEmptyAreaClick(): void {
    console.info('onEmptyAreaClick is called');
  }

  private onSelect(uri: string): void {
    if (uri) {
      this.selectedUris.push(uri);
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onSelect' + JSON.stringify(this.selectedUris));
  }

  private onDeselect(uri: string): void {
    if (uri) {
      this.selectedUris = this.selectedUris.filter((item: string) => {
        return item !== uri;
      })
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onDeselect' + JSON.stringify(this.selectedUris));
  }

  private onItemClicked(itemInfo: ItemInfo, clickType: ClickType): boolean {
    if (!itemInfo) {
      return false;
    }

    this.sendEvent(itemInfo, EventType.SELECT_ITEM_INFO);
    this.sendEvent(clickType, EventType.SELECT_CLICKTYPE);
    let type: ItemType | undefined = itemInfo.itemType;
    let uri: string | undefined = itemInfo.uri;
    if (type === ItemType.CAMERA) {
      console.info('onCameraClick');
      if (this.isBlock) {
        return false;
      }
    } else if (type === ItemType.THUMBNAIL) {
      if (clickType === ClickType.SELECTED) {
        if (this.isBlock) {
          return false;
        }
        if (uri) {
          this.selectedUris.push(uri);
          this.pickerOptions.preselectedUris = [...this.selectedUris];
        }
      }
    } else {
      if (uri) {
        this.selectedUris = this.selectedUris.filter((item: String) => {
          return item !== uri;
        })
        this.pickerOptions.preselectedUris = [...this.selectedUris];
      }
    }
    console.info('onItemClicked' + JSON.stringify(itemInfo));
    return true;
  }

  aboutToDisappear(): void {
    console.info('testPicker disappear');
  }

  aboutToAppear() {
    console.info('PickerComponent aboutToAppear enter')
    const router: Router = AppStorage.get<Router>('router') as Router;
    const parameter = router.getParams() as RouterOptionsParams;
    this.eventId = parameter?.eventId ?? 0;
    this.pickerOptions = parameter?.pickerOptions ?? new PickerOptions();
    this.albumOptions = parameter?.albumOptions ?? new AlbumPickerOptions();
    console.info('eventId=' + this.eventId);
  }

  @Builder
  tabBuilder(index: int, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  @Builder
  ButtonBar() {
    Row() {
      Button('视频与图片').width('50%').height('5%')
        .onClick((e: ClickEvent) => {
          this.isShowAll = true;
          this.isShowVideo = false;
          this.isShowPhoto = false;
          if (this.selectedUris.length != 0) {
            this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
          } else {
            console.error('selectedUris length: ' + this.selectedUris.length);
          }
        }).id('setDataButton')
      Button('全部相册').width('50%').height('5%')
        .onClick((e: ClickEvent) => {
          this.isShowAlbum = true;
        }).id('albumButton')
    } .margin({ top: '10vp', bottom: '5vp' } as Margin)

    Row() {
      Button('返回测试结果').width('33%').height('5%').onClick((e: ClickEvent) => {
        console.info('testPicker setData');
        let result: PhotoPickerResult = this.getPhotoPickerResult();
        this.sendEvent(result, EventType.PHOTO_PICKER_INFO);
      }).id('resultButton')
      Button('选择修改数量').width('33%').height('5%').onClick((e: ClickEvent) => {
        let maxSelect: MaxSelected = new MaxSelected();
        maxSelect.data = new Map<MaxCountType, int>([[MaxCountType.TOTAL_MAX_COUNT, 500],
          [MaxCountType.PHOTO_MAX_COUNT, 500], [MaxCountType.VIDEO_MAX_COUNT, 500]]);
        this.pickerController.setMaxSelected(maxSelect);
      }).id('changeNumButton')
      Button('退出大图').width('33%').height('5%').onClick((e: ClickEvent) => {
        this.pickerController.exitPhotoBrowser();
      }).id('exitBrowser')
    }
  }

  @Builder
  buildPhotoPickerComponent() {
    Stack() {
      PhotoPickerComponent({
        pickerOptions: this.pickerOptions,
        onSelect: (uri: string): void => this.onSelect(uri),
        onDeselect: (uri: string): void => this.onDeselect(uri),
        onItemClicked: (itemInfo: ItemInfo, clickType: ClickType): boolean =>
        this.onItemClicked(itemInfo, clickType),
        onEnterPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onEnterPhotoBrowser(photoBrowserInfo),
        onExitPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onExitPhotoBrowser(photoBrowserInfo),
        onPickerControllerReady: (): void => this.onPickerControllerReady(),
        onPhotoBrowserChanged: (browserItemInfo: BaseItemInfo): boolean => this.onPhotoBrowserChanged(browserItemInfo),
        onSelectedItemsDeleted: this.selectedItemsDeletedCallback,
        onExceedMaxSelected: this.exceedMaxSeletedCallback,
        onCurrentAlbumDeleted: this.currentAlbumDeletedCallback,
        onVideoPlayStateChanged: this.videoPlayStateChangedCallback,
        pickerController: this.pickerController,
      })
    }
    .height('70%')
    .width('100%')
    .visibility(this.isShowAll ? Visibility.Visible : Visibility.Hidden)
    .id('PhotoPickerComponent')
  }

  @Builder
  buildFooter(){
    // 缩略图
    if (this.isBrowserShow) {
      Row() {
        ForEach(this.selectedUris, (uri: string, index: int) => {
          Image(uri)
            .height('10%')
            .width('20%')
            .backgroundColor(this.allBackGroundColor)
            .onClick((e: ClickEvent) => {
              console.log('uri: ' + uri + ' is click');
              this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.ALL);
            })
            .id('smallImage')
        })
      }.offset({
        y: 420
      } as Position)
    } else {
      Button('预览')
        .width('33%')
        .height('15vp')
        .onClick((e: ClickEvent) => {
          if (this.selectedUris.length > 0) {
            this.pickerController.setPhotoBrowserItem(this.selectedUris[0], PhotoBrowserRange.SELECTED_ONLY);
            this.isBrowserShow = true;
          }
        })
        .id('previewButton')
    }
  }

  @Builder
  buildImage(){
    ForEach<string>(this.selectedUris, (uri: string, index: int) => {
      Image(uri).height('10%').width('20%').onClick((e: ClickEvent) => {
        this.selectedUris = this.selectedUris.filter((item: string) => {
          return uri != item;
        })
        if (this.selectedUris.length > 0) {
          this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
        }
      })
    }, (uri: string, index: int) => JSON.stringify(uri))
  }

  @Builder
  buildAlbumPickerComponent() {
    Row() {
      this.buildImage();
    }

    if (this.isShowAlbum) {
      Stack() {
        AlbumPickerComponent({
          albumPickerOptions: this.albumOptions,
          onAlbumClick: (albumInfo: AlbumInfo): boolean => this.onAlbumClick(albumInfo),
          onEmptyAreaClick: (): void => this.onEmptyAreaClick(),
        })
      }.height('100%').width('100%').id('AlbumPickerComponent')
    }
  }

  build() {
    Stack() {
      Column() {
        this.ButtonBar();
        this.buildPhotoPickerComponent();
        this.buildFooter();
      }
      this.buildAlbumPickerComponent();
    }
  }
}