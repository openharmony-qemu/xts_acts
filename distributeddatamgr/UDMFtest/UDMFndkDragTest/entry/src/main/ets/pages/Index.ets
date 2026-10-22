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
import { unifiedDataChannel, uniformDataStruct, uniformTypeDescriptor } from '@kit.ArkData';
import { fileIo, fileUri} from '@kit.CoreFileKit';
import { NodeContent } from '@kit.ArkUI';
import testNapi from 'libentry.so';

@Entry
@Component
struct Index {
  @State positionX: number = 0;
  @State positionY: number = 0;
  private startX: number = 0;
  private startY: number = 0;
  private readonly nativeDropContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    testNapi.CreateDropTarget_001(this.nativeDropContent);
  }

  private createTestFileUri(a: string): string {
    const context = this.getUIContext().getHostContext();
    if (!context) {
      return '';
    }
    try {
      const path = `${context.filesDir}/test.${a}`;
      const file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(file);
      console.log(`DragTest: `, fileUri.getUriFromPath(path));
      return fileUri.getUriFromPath(path);
    } catch (error) {
      console.error(`[DragSummaryDemo] Failed to create the test file URI: ${error}`);
      return '';
    }
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Row({ space: 10 }) {
        Column() {
          Image($r('app.media.icon'))
            .id('icon')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              const uri_1 = this.createTestFileUri('photo.png?x=.jpg#y');
              if (uri_1.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let image_1 = new unifiedDataChannel.Image();
              image_1.imageUri = uri_1;

              const uri_2 = this.createTestFileUri('mp3');
              if (uri_2.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let fileUri: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: uri_2,
                fileType: 'general.audio'
              };

              let file_2_Record = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.AUDIO, fileUri);
              unifiedData.addRecord(file_2_Record);
              unifiedData.addRecord(image_1);

              event.setData(unifiedData);
              return {};
            })
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon2')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              const uri_1 = this.createTestFileUri('mp3');
              if (uri_1.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let fileUri: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: uri_1,
                fileType: 'general.audio'
              };

              const uri_2 = this.createTestFileUri('mp4');
              if (uri_2.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let fileUri2: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: uri_2,
                fileType: 'general.video'
              };

              let file_1_Record = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.AUDIO, fileUri);
              let file_2_Record = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.VIDEO, fileUri2);
              unifiedData.addRecord(file_1_Record);
              unifiedData.addRecord(file_2_Record);

              event.setData(unifiedData);
              return {};
            })
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon3')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              const uri_1 = this.createTestFileUri('photo.png?x=.jpg#y');
              if (uri_1.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let image_1 = new unifiedDataChannel.Image();
              image_1.imageUri = uri_1;
              unifiedData.addRecord(image_1);

              event.setData(unifiedData);
              return {};
            })
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon4')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              const uri_1 = this.createTestFileUri('a/.profile');
              if (uri_1.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let file_1 = new unifiedDataChannel.File();
              file_1.uri = uri_1;

              const uri_2 = this.createTestFileUri('a/README');
              if (uri_2.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let file_2 = new unifiedDataChannel.File();
              file_2.uri = uri_2;

              const uri_3 = this.createTestFileUri('a/name.');
              if (uri_3.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                return {};
              }
              let file_3 = new unifiedDataChannel.File();
              file_3.uri = uri_3;

              let file_4 = new unifiedDataChannel.Image();
              file_4.uri = 'http://com.example.udmfdragtest/file.png';

              unifiedData.addRecord(file_1);
              unifiedData.addRecord(file_2);
              unifiedData.addRecord(file_3);
              unifiedData.addRecord(file_4);

              event.setData(unifiedData);
              return {};
            })
        }

        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('15%')

        Row({ space: 10 }) {
        Column() {
          Image($r('app.media.icon'))
            .id('icon5')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon6')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              let uri_0 = this.createTestFileUri('a/');
              for (let index = 0; index < 1000; index++) {
                let uri = uri_0 + index + '.png';
                if (uri.length === 0) {
                  console.error('[DragSummaryDemo] Failed to obtain the application sandbox path.');
                  return {};
                }
                let image = new unifiedDataChannel.Image();
                image.imageUri = uri;
                unifiedData.addRecord(image);
              }

              event.setData(unifiedData);
              return {};
            })
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon7')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              const audioExtensions: string[] = [
                'ogg', 'aiff', 'pcm', 'flac', 'alac', 'mp3', 'aac', 'au', 'snd', 'aifc',
                'aif', 'amr', 'awb', 'gsm', 'imy', 'kar', 'm3u', 'm4a', 'm4b', 'mid',
                'midi', 'mp2', 'mpga', 'mxmf', 'ota', 'pls', 'rtttl', 'sid', 'psid', 'ulw',
                'xmf', 'ac3', 'caf', 'wav', 'wave', 'wma', 'wax', 'm4p', 'ram', 'ra',
                'sd2', 'mka', 'mmf', 'oga', 'skd', 'skm', 'skp', 'skt', 'ape', 'opus'
              ];
              const audioFiles: unifiedDataChannel.Audio[] = [];
              for (const ext of audioExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Audio();
                file.audioUri = uri;
                audioFiles.push(file);
              }

              const videoExtensions: string[] = [
                'avi', 'vfw', 'mpg', 'mpeg', 'm75', 'm15', 'mpe', 'mp4', 'mp4v', 'mpeg4',
                '3gp', '3gpp', '3g2', '3gp2', '3gpp2', 'vob', 'dif', 'dv', 'fli', 'flc',
                'mng', 'mxu', 'm4u', 'ts', 'm2ts', 'mts', 'm2t', 'mpeg2', 'mpv2', 'mp2v',
                'm2v', 'mpv', 'mpeg1', 'mpv1', 'mp1v', 'm1v', 'divx', 'ogv', 'h264',
                'wm', 'wmv', 'wmp', 'wmx', 'wvx', 'asx', 'lsf', 'lsx', 'dcr', 'dir',
                'dxr', 'spl', 'swf', 'flv', 'f4v', 'rm', 'rmvb', 'rv', 'mkv', 'movie',
                'webm', 'm4v', 'mov', 'qt', 'yt', 'vt', 'wrf', 'axv'
              ];
              const videoFiles: unifiedDataChannel.Video[] = [];
              for (const ext of videoExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Video();
                file.videoUri = uri;
                videoFiles.push(file);
              }

              const imageExtensions: string[] = [
                'png', 'jpg', 'jpeg', 'jpe', 'tif', 'tiff', 'xbm', 'gif', 'djv', 'djvu',
                'jng', 'pcx', 'pbm', 'pgm', 'pnm', 'ppm', 'rgb', 'svg', 'svgz', 'wbmp',
                'xpm', 'xwd', 'heif', 'heifs', 'hif', 'heic', 'heics', 'jp2', 'jpg2', 'jpx',
                'jpf', 'jpm', 'ief', 'bmp', 'bm', 'ico', 'cur', 'dds', 'odi', 'oti',
                'psd', 'ai', 'ras', 'tga', 'sgi', 'exr', 'fpx', 'cdr', 'cdt', 'cpt',
                'pat', 'ilbm', 'avif', 'webp', 'xcf', 'art'
              ];
              const imageFiles: unifiedDataChannel.Image[] = [];
              for (const ext of imageExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Image();
                file.imageUri = uri;
                imageFiles.push(file);
              }

              let loadHandler: unifiedDataChannel.DataLoadHandler = (acceptableInfo) => {
                if (acceptableInfo != undefined) {
                  console.log(`DragTest: `, `loadHandler recordCount=${acceptableInfo.recordCount}`);
                  if (acceptableInfo.types != undefined) {
                    for (let type of acceptableInfo.types) {
                      console.log(`DragTest: `, `loadHandler type=${type}`);
                    }
                  }
                }
                let unifiedData = new unifiedDataChannel.UnifiedData();

                for (let i of audioFiles) {
                  unifiedData.addRecord(i);
                }

                for (let i of videoFiles) {
                  unifiedData.addRecord(i);
                }

                for (let i of imageFiles) {
                  unifiedData.addRecord(i);
                }
                console.log(`DragTest: `, `loadHandler records=${unifiedData.getRecords().length}`);
                return unifiedData
              }

              (event as DragEvent).setDataLoadParams({
                loadHandler: loadHandler,
                dataLoadInfo: {
                  types: new Set<string>([
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
                  ])
                }
              })
              return {};
            })
        }

        Column() {
          Image($r('app.media.icon'))
            .id('icon8')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `Drag1 start`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              const audioExtensions: string[] = [
                'ogg', 'aiff', 'pcm', 'flac', 'alac', 'mp3', 'aac', 'au', 'snd', 'aifc',
                'aif', 'amr', 'awb', 'gsm', 'imy', 'kar', 'm3u', 'm4a', 'm4b', 'mid',
                'midi', 'mp2', 'mpga', 'mxmf', 'ota', 'pls', 'rtttl', 'sid', 'psid', 'ulw',
                'xmf', 'ac3', 'caf', 'wav', 'wave', 'wma', 'wax', 'm4p', 'ram', 'ra',
                'sd2', 'mka', 'mmf', 'oga', 'skd', 'skm', 'skp', 'skt', 'ape', 'opus'
              ];
              const audioFiles: unifiedDataChannel.Audio[] = [];
              for (const ext of audioExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Audio();
                file.audioUri = uri;
                audioFiles.push(file);
              }

              const videoExtensions: string[] = [
                'avi', 'vfw', 'mpg', 'mpeg', 'm75', 'm15', 'mpe', 'mp4', 'mp4v', 'mpeg4',
                '3gp', '3gpp', '3g2', '3gp2', '3gpp2', 'vob', 'dif', 'dv', 'fli', 'flc',
                'mng', 'mxu', 'm4u', 'ts', 'm2ts', 'mts', 'm2t', 'mpeg2', 'mpv2', 'mp2v',
                'm2v', 'mpv', 'mpeg1', 'mpv1', 'mp1v', 'm1v', 'divx', 'ogv', 'h264',
                'wm', 'wmv', 'wmp', 'wmx', 'wvx', 'asx', 'lsf', 'lsx', 'dcr', 'dir',
                'dxr', 'spl', 'swf', 'flv', 'f4v', 'rm', 'rmvb', 'rv', 'mkv', 'movie',
                'webm', 'm4v', 'mov', 'qt', 'yt', 'vt', 'wrf', 'axv'
              ];
              const videoFiles: unifiedDataChannel.Video[] = [];
              for (const ext of videoExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Video();
                file.videoUri = uri;
                videoFiles.push(file);
              }

              const imageExtensions: string[] = [
                'png', 'jpg', 'jpeg', 'jpe', 'tif', 'tiff', 'xbm', 'gif', 'djv', 'djvu',
                'jng', 'pcx', 'pbm', 'pgm', 'pnm', 'ppm', 'rgb', 'svg', 'svgz', 'wbmp',
                'xpm', 'xwd', 'heif', 'heifs', 'hif', 'heic', 'heics', 'jp2', 'jpg2', 'jpx',
                'jpf', 'jpm', 'ief', 'bmp', 'bm', 'ico', 'cur', 'dds', 'odi', 'oti',
                'psd', 'ai', 'ras', 'tga', 'sgi', 'exr', 'fpx', 'cdr', 'cdt', 'cpt',
                'pat', 'ilbm', 'avif', 'webp', 'xcf', 'art'
              ];
              const imageFiles: unifiedDataChannel.Image[] = [];
              for (const ext of imageExtensions) {
                const uri = this.createTestFileUri(ext);
                if (uri.length === 0) {
                  console.error(`[DragSummaryDemo] Failed to obtain the application sandbox path: ${ext}`);
                  return {};
                }
                const file = new unifiedDataChannel.Image();
                file.imageUri = uri;
                imageFiles.push(file);
              }

              for (let i of audioFiles) {
                unifiedData.addRecord(i);
              }
              for (let i of videoFiles) {
                unifiedData.addRecord(i);
              }
              for (let i of imageFiles) {
                unifiedData.addRecord(i);
              }

              event.setData(unifiedData);
              return {};
            })
        }

      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('15%')
      }
      .width('100%')
      .height('50%')

      Stack() {
        ContentSlot(this.nativeDropContent)
      }
      .id('nativeDropArea')
      .width('80%')
      .height(120)
    }
    .height('100%')
    .width('100%')
  }
}