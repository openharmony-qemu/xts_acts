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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, RelativeContainer, DragEvent, Row, Image, $r, ImageFit, DragItemInfo, FlexAlign, HitTestMode } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { unifiedDataChannel, uniformDataStruct, uniformTypeDescriptor } from '@kit.ArkData';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import hilog from '@ohos.hilog';

// Complete audio extension set used to build drag records of general.audio.
const AUDIO_FILE_EXTENSIONS: string[] = [
  'ogg', 'aiff', 'pcm', 'flac', 'alac', 'mp3', 'aac', 'au', 'snd', 'aifc',
  'aif', 'amr', 'awb', 'gsm', 'imy', 'kar', 'm3u', 'm4a', 'm4b', 'mid',
  'midi', 'mp2', 'mpga', 'mxmf', 'ota', 'pls', 'rtttl', 'sid', 'psid', 'ulw',
  'xmf', 'ac3', 'caf', 'wav', 'wave', 'wma', 'wax', 'm4p', 'ram', 'ra',
  'sd2', 'mka', 'mmf', 'oga', 'skd', 'skm', 'skp', 'skt', 'ape', 'opus'
];

// Complete video extension set used to build drag records of general.video.
const VIDEO_FILE_EXTENSIONS: string[] = [
  'avi', 'vfw', 'mpg', 'mpeg', 'm75', 'm15', 'mpe', 'mp4', 'mp4v', 'mpeg4',
  '3gp', '3gpp', '3g2', '3gp2', '3gpp2', 'vob', 'dif', 'dv', 'fli', 'flc',
  'mng', 'mxu', 'm4u', 'ts', 'm2ts', 'mts', 'm2t', 'mpeg2', 'mpv2', 'mp2v',
  'm2v', 'mpv', 'mpeg1', 'mpv1', 'mp1v', 'm1v', 'divx', 'ogv', 'h264',
  'wm', 'wmv', 'wmp', 'wmx', 'wvx', 'asx', 'lsf', 'lsx', 'dcr', 'dir',
  'dxr', 'spl', 'swf', 'flv', 'f4v', 'rm', 'rmvb', 'rv', 'mkv', 'movie',
  'webm', 'm4v', 'mov', 'qt', 'yt', 'vt', 'wrf', 'axv'
];

// Complete image extension set used to build drag records of general.image.
const IMAGE_FILE_EXTENSIONS: string[] = [
  'png', 'jpg', 'jpeg', 'jpe', 'tif', 'tiff', 'xbm', 'gif', 'djv', 'djvu',
  'jng', 'pcx', 'pbm', 'pgm', 'pnm', 'ppm', 'rgb', 'svg', 'svgz', 'wbmp',
  'xpm', 'xwd', 'heif', 'heifs', 'hif', 'heic', 'heics', 'jp2', 'jpg2', 'jpx',
  'jpf', 'jpm', 'ief', 'bmp', 'bm', 'ico', 'cur', 'dds', 'odi', 'oti',
  'psd', 'ai', 'ras', 'tga', 'sgi', 'exr', 'fpx', 'cdr', 'cdt', 'cpt',
  'pat', 'ilbm', 'avif', 'webp', 'xcf', 'art'
];

// Uniform types accepted by the deferred data loading handler, matching the
// audio, video and image extension sets above.
const DEFERRED_LOAD_TYPES: string[] = [
  'general.png',
  'general.jpeg',
  'general.tiff',
  'general.xbitmap-image',
  'general.gif',
  'general.djvu-image',
  'general.jng-image',
  'general.pcx-image',
  'general.pbm-image',
  'general.pgm-image',
  'general.pnm-image',
  'general.ppm-image',
  'general.rgb-image',
  'general.svg-image',
  'general.wbmp-image',
  'general.xpixmap-image',
  'general.xwindowdump-image',
  'general.heif',
  'general.heic',
  'general.jpeg-2000',
  'general.ief-image',
  'com.microsoft.bmp',
  'com.microsoft.ico',
  'com.microsoft.cur',
  'com.microsoft.dds',
  'org.oasis-open.opendocument.image',
  'org.oasis-open.opendocument.image-template',
  'com.adobe.photoshop-image',
  'com.adobe.illustrator.ai-image',
  'com.sun.raster',
  'com.truevision.tga-image',
  'com.sgi.sgi-image',
  'com.ilm.openexr-image',
  'com.kodak.flashpix.image',
  'com.coreldraw.cdr',
  'com.coreldraw.cdt',
  'com.coreldraw.cpt',
  'com.coreldraw.pat',
  'com.ea.iff-ilbm',
  'org.aomedia.avif-image',
  'com.google.webp',
  'org.gimp.xcf',
  'com.aol.art-image',
  'general.avi',
  'general.mpeg',
  'general.mpeg-4',
  'general.3gpp',
  'general.3gpp2',
  'general.vob',
  'general.dif-video',
  'general.dv-video',
  'general.flc-animation',
  'general.mng',
  'general.mpegurl-video',
  'general.ts',
  'general.mp2t',
  'general.mpeg-2',
  'general.mpeg-1',
  'general.divx-video',
  'general.ogv',
  'general.h264-video',
  'com.microsoft.windows-media-wm',
  'com.microsoft.windows-media-wmv',
  'com.microsoft.windows-media-wmp',
  'com.microsoft.windows-media-wmx',
  'com.microsoft.windows-media-wvx',
  'com.microsoft.advanced-stream-redirector',
  'com.microsoft.lsf-video',
  'com.adobe.dcr',
  'com.adobe.dir',
  'com.adobe.dxr',
  'com.adobe.futuresplash',
  'com.adobe.flash',
  'com.adobe.f4v',
  'com.real.realmedia',
  'com.real.realmedia-vbr',
  'com.real.realvideo',
  'org.matroska.mkv',
  'com.sgi.movie',
  'org.webmproject.webm',
  'com.apple.m4v',
  'com.apple.quicktime-movie',
  'com.youtube.video',
  'com.cisco.webex-video',
  'org.csiro.annodex',
  'general.ogg',
  'general.aiff',
  'general.pcm',
  'general.flac',
  'general.alac',
  'general.mp3',
  'general.aac',
  'general.au-audio',
  'general.aifc-audio',
  'general.amr',
  'general.amr-wb',
  'general.gsm',
  'general.imy',
  'general.kar',
  'general.mpegurl-audio',
  'general.mpeg-4-audio',
  'general.midi-audio',
  'general.mp2',
  'general.mpeg-audio',
  'general.mxmf',
  'general.ota',
  'general.pls',
  'general.rtttl',
  'general.psid',
  'general.ulaw-audio',
  'general.xmf',
  'general.ac3-audio',
  'com.apple.coreaudio-format',
  'com.microsoft.waveform-audio',
  'com.microsoft.windows-media-wma',
  'com.microsoft.windows-media-wax',
  'com.apple.m4p-audio',
  'com.real.realaudio',
  'com.digidesign.sd2-audio',
  'org.matroska.mka',
  'com.yamaha.smaf',
  'org.xiph.ogg',
  'com.sseyo.koan-audio',
  'com.monkeysaudio.ape-audio',
  'org.xiph.opus-audio'
];

@Entry
@Component
struct Index {
  @State positionX: number = 0;
  @State positionY: number = 0;
  private startX: number = 0;
  private startY: number = 0;

  // Creates an empty sandbox file "test.<extension>" and returns its URI.
  private createTestFileUri(extension: string): string {
    const context = this.getUIContext().getHostContext();
    if (!context) {
      return '';
    }
    try {
      const path = `${context.filesDir}/test.${extension}`;
      const file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(file);
      console.log(`DragTest: `, fileUri.getUriFromPath(path));
      return fileUri.getUriFromPath(path);
    } catch (error) {
      console.error(`[DragSummaryDemo] Failed to create the test file URI: ${error}`);
      return '';
    }
  }

  // Builds one audio record per extension; returns null on failure.
  private buildAudioRecords(): unifiedDataChannel.Audio[] | null {
    const audioFiles: unifiedDataChannel.Audio[] = [];
    for (const extension of AUDIO_FILE_EXTENSIONS) {
      const uri = this.createTestFileUri(extension);
      if (uri.length === 0) {
        console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
        return null;
      }
      const audioRecord = new unifiedDataChannel.Audio();
      audioRecord.audioUri = uri;
      audioFiles.push(audioRecord);
    }
    return audioFiles;
  }

  // Builds one video record per extension; returns null on failure.
  private buildVideoRecords(): unifiedDataChannel.Video[] | null {
    const videoFiles: unifiedDataChannel.Video[] = [];
    for (const extension of VIDEO_FILE_EXTENSIONS) {
      const uri = this.createTestFileUri(extension);
      if (uri.length === 0) {
        console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
        return null;
      }
      const videoRecord = new unifiedDataChannel.Video();
      videoRecord.videoUri = uri;
      videoFiles.push(videoRecord);
    }
    return videoFiles;
  }

  // Builds one image record per extension; returns null on failure.
  private buildImageRecords(): unifiedDataChannel.Image[] | null {
    const imageFiles: unifiedDataChannel.Image[] = [];
    for (const extension of IMAGE_FILE_EXTENSIONS) {
      const uri = this.createTestFileUri(extension);
      if (uri.length === 0) {
        console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
        return null;
      }
      const imageRecord = new unifiedDataChannel.Image();
      imageRecord.imageUri = uri;
      imageFiles.push(imageRecord);
    }
    return imageFiles;
  }

  build() {
    RelativeContainer() {
      Column() {
        Row() {
        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              const audioFiles = this.buildAudioRecords();
              if (audioFiles === null) {
                return {} as DragItemInfo;
              }
              const videoFiles = this.buildVideoRecords();
              if (videoFiles === null) {
                return {} as DragItemInfo;
              }
              const imageFiles = this.buildImageRecords();
              if (imageFiles === null) {
                return {} as DragItemInfo;
              }

              let unifiedData = new unifiedDataChannel.UnifiedData();
              for (let audioRecord of audioFiles) {
                unifiedData.addRecord(audioRecord);
              }
              for (let videoRecord of videoFiles) {
                unifiedData.addRecord(videoRecord);
              }
              for (let imageRecord of imageFiles) {
                unifiedData.addRecord(imageRecord);
              }

              event.setData(unifiedData);
              return {} as DragItemInfo;
            })
        }

        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon2')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              // Two file-uri records: an audio mp3 file and a video mp4 file.
              const audioUri = this.createTestFileUri('mp3');
              if (audioUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let audioFileUri: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: audioUri,
                fileType: 'general.audio'
              };

              const videoUri = this.createTestFileUri('mp4');
              if (videoUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let videoFileUri: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: videoUri,
                fileType: 'general.video'
              };

              let audioRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.AUDIO, audioFileUri);
              let videoRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.VIDEO, videoFileUri);
              unifiedData.addRecord(audioRecord);
              unifiedData.addRecord(videoRecord);

              event.setData(unifiedData);
              return {} as DragItemInfo;
            })
        }
      }
      .justifyContent(FlexAlign.Center)

      Row() {
        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon3')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              // The query/fragment parts of the URI must not affect the
              // resolved .png extension.
              const trickyUri = this.createTestFileUri('photo.png?x=.jpg#y');
              if (trickyUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let imageRecord = new unifiedDataChannel.Image();
              imageRecord.imageUri = trickyUri;
              unifiedData.addRecord(imageRecord);

              event.setData(unifiedData);
              return {} as DragItemInfo;
            })
        }

        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon4')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              // Hidden files and files without a valid extension contribute
              // no filename extension; only the explicit .png image does.
              const profileUri = this.createTestFileUri('a/.profile');
              if (profileUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let profileRecord = new unifiedDataChannel.File();
              profileRecord.uri = profileUri;

              const readmeUri = this.createTestFileUri('a/README');
              if (readmeUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let readmeRecord = new unifiedDataChannel.File();
              readmeRecord.uri = readmeUri;

              const emptyExtUri = this.createTestFileUri('a/name.');
              if (emptyExtUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let emptyExtRecord = new unifiedDataChannel.File();
              emptyExtRecord.uri = emptyExtUri;

              let imageRecord = new unifiedDataChannel.Image();
              imageRecord.uri = 'http://com.example.udmfdragtest/file.png';

              unifiedData.addRecord(profileRecord);
              unifiedData.addRecord(readmeRecord);
              unifiedData.addRecord(emptyExtRecord);
              unifiedData.addRecord(imageRecord);

              event.setData(unifiedData);
              return {} as DragItemInfo;
            })
        }
      }
      .justifyContent(FlexAlign.Center)

      Row() {
        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon5')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
        }

        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon6')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              // Stress case: 1000 image records dragged at once.
              const baseUri = this.createTestFileUri('a/');
              for (let index = 0; index < 1000; index++) {
                let uri = baseUri + index + '.png';
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                  return {} as DragItemInfo;
                }
                let imageRecord = new unifiedDataChannel.Image();
                imageRecord.imageUri = uri;
                unifiedData.addRecord(imageRecord);
              }

              event.setData(unifiedData);
              return {} as DragItemInfo;
            })
        }
      }
      .justifyContent(FlexAlign.Center)

      Row() {
        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon7')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              // Records are prepared up front but only handed over through
              // the deferred load handler.
              const audioFiles = this.buildAudioRecords();
              if (audioFiles === null) {
                return {} as DragItemInfo;
              }
              const videoFiles = this.buildVideoRecords();
              if (videoFiles === null) {
                return {} as DragItemInfo;
              }
              const imageFiles = this.buildImageRecords();
              if (imageFiles === null) {
                return {} as DragItemInfo;
              }

              let loadHandler: unifiedDataChannel.DataLoadHandler = (acceptableInfo?: unifiedDataChannel.DataLoadInfo) => {
                let unifiedData = new unifiedDataChannel.UnifiedData();

                for (let audioRecord of audioFiles) {
                  unifiedData.addRecord(audioRecord);
                }

                for (let videoRecord of videoFiles) {
                  unifiedData.addRecord(videoRecord);
                }

                for (let imageRecord of imageFiles) {
                  unifiedData.addRecord(imageRecord);
                }
                console.log(`DragTest: `, `loadHandler records=${unifiedData.getRecords().length}`);
                return unifiedData
              }

              (event as DragEvent).setDataLoadParams({
                loadHandler: loadHandler,
                dataLoadInfo: {
                  types: new Set<string>(DEFERRED_LOAD_TYPES)
                }
              })
              return {} as DragItemInfo;
            })
        }

        Column() {
          Image($r('app.media.startIcon'))
            .id('startIcon8')
            .width(50)
            .height(50)
            .margin(30)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              console.log('DragTest: ', 'Drag start');
              this.startX = this.positionX;
              this.startY = this.positionY;

              // Single mp3 record delivered via deferred loading; the summary
              // captured on drag start must not contain the extension yet.
              const audioUri = this.createTestFileUri('mp3');
              if (audioUri.length === 0) {
                console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path.`);
                return {} as DragItemInfo;
              }
              let audioFileUri: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: audioUri,
                fileType: 'general.audio'
              };

              let loadHandler: unifiedDataChannel.DataLoadHandler = (acceptableInfo?: unifiedDataChannel.DataLoadInfo) => {
                let unifiedData = new unifiedDataChannel.UnifiedData();
                let audioRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.AUDIO, audioFileUri)
                unifiedData.addRecord(audioRecord);
                console.log(`DragTest: `, `loadHandler records=${unifiedData.getRecords().length}`);

                return unifiedData
              }

              (event as DragEvent).setDataLoadParams({
                loadHandler: loadHandler,
                dataLoadInfo: {
                  types: new Set<string>(['general.mp3'])
                }
              })

              try {
                let summary = event.getSummary();
                let summaryObj: Record<string, Object> = {
                  'summary': summary!.summary,
                  'overview': summary!.overview,
                  'totalSize': summary!.totalSize,
                  'filenameExtensions': summary!.filenameExtensions
                };
                let summaryStr = JSON.stringify(summaryObj);
                console.log(`DragTest: `, `onDragStart summary=${summaryStr}`);
                AppStorage.setOrCreate('dragSummary_start', summaryObj);
              } catch (err) {
                console.error(`[DragSummaryDemo] getSummary on start failed: ${JSON.stringify(err)}`);
              }

              return {} as DragItemInfo;
            })
        }
      }
      .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)

      Column()
        .id('dropTarget')
        .width('100%')
        .height('100%')
        .hitTestBehavior(HitTestMode.Transparent)
        .onDragEnter((event: DragEvent) => {
          try {
            let summary = event.getSummary();
            let summaryObj: Record<string, Object> = {
              'summary': summary!.summary,
              'overview': summary!.overview,
              'totalSize': summary!.totalSize,
              'filenameExtensions': summary!.filenameExtensions
            };
            let summaryStr = JSON.stringify(summaryObj);
            console.log(`DragTest: `, `onDragEnter summary=${summaryStr}`);
            AppStorage.setOrCreate('dragSummary', summaryObj);
          } catch (err) {
            console.error(`[DragSummaryDemo] getSummary on start failed: ${JSON.stringify(err)}`);
          }
        })
        .onDrop((event: DragEvent) => {
          try {
            let summary = event.getSummary();
            let summaryObj: Record<string, Object> = {
              'summary': summary!.summary,
              'overview': summary!.overview,
              'totalSize': summary!.totalSize,
              'filenameExtensions': summary!.filenameExtensions
            };
            let summaryStr = JSON.stringify(summaryObj);
            console.log(`DragTest: `, `onDragEnter summary=${summaryStr}`);
            AppStorage.setOrCreate('dragSummary', summaryObj);
          } catch (err) {
            console.error(`[DragSummaryDemo] getSummary on start failed: ${JSON.stringify(err)}`);
          }
        })
    }
  }
}
