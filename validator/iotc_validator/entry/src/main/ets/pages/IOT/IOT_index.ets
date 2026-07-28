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
import promptAction from '@ohos.promptAction'
import router from '@ohos.router';
import xml from '@ohos.xml';
import fs from '@ohos.file.fs';
import data_preferences from '@ohos.data.preferences';
import FlushData from '../model/FlushData';
import IotHelper from './model/IotHelper';
import { common } from '@kit.AbilityKit';
import util from '@ohos.util';
import Logger from '../model/Logger';
import { filterTestCases, PageCase, NewTestCaseList, TestCaseList } from './model/IotConstants';

const TAG = 'Iot_index';
let path: string = globalThis.dir;
let iotPath: string = path + '/IOT';

let colorBackPath = path + '/IOTColorBack.txt';
let txtPath = iotPath + '/IOTReport.txt';
let iotScanTxtPath = iotPath + '/IOTScanReport.txt';
let colorTxtPath = iotPath + '/ColorReport.txt';
let xmlPath = iotPath + '/IOTTest.xml';
let configColorBackPath = path + '/IOTConfigColorBack.txt';
let configTxtPath = iotPath + '/IOTConfigReport.txt';
let configXmlPath = iotPath + '/IOTConfigTest.xml';

@Entry
@Component
struct Iot_index {
  @State clearAll: boolean = false;
  private current: number = 0;
  @State count: number = 0;
  @State result: string = '';
  @State testTag: number = 0;
  @State resultMap: Record<string, string> = {};
  @State filteredList: PageCase[] = TestCaseList;
  @State isConfigMode: boolean = false;

  aboutToAppear(): void {
    IotHelper.getInstance().init(getContext(this) as common.UIAbilityContext);
    let config = IotHelper.getInstance().getDeviceConfig();
    if (config) {
      this.isConfigMode = true;
      this.filteredList = filterTestCases(config);
      this.resetConfigColorFile();
    } else {
      this.isConfigMode = false;
    }
  }

  aboutToDisappear(): void {
    IotHelper.getInstance().stopConnect();
  }

  async onPageShow() {
    let preferences = await data_preferences.getPreferences(getContext(this), 'mystore');
    let testCase = await preferences.get('IOT', 0);
    Logger.info(TAG, `Succeeded in getting value of 'IOT'. Data:  =${testCase}`);
    if (testCase != 1 && !this.isConfigMode) {
      let fd = fs.openSync(this.isConfigMode ? configColorBackPath : colorBackPath,
        fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      for (let i = 0; i < this.filteredList.length; i++) {
        let log = (this.filteredList[i].title + ';' + 'none ' + ';').toString();
        fs.writeSync(fd.fd, log);
      }
      fs.closeSync(fd);
    }
    preferences.put('IOT', 1).then(() => {
      Logger.info(TAG, `Succeeded in putting value of 'IOT'.`);
    });
    preferences.flush().then(() => {
      Logger.info(TAG, `Succeeded in flushing.`);
    });
    this.testTag = testCase as number;

    let opt =
      fs.openSync(this.isConfigMode ? configColorBackPath : colorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buff = new ArrayBuffer(40960);
    let RD = fs.readSync(opt.fd, buff);
    let uint8Array = new Uint8Array(buff, 0, RD);
    let colorBack: string = String.fromCharCode(...uint8Array);
    let testList = colorBack.split(';');
    let newMap: Record<string, string> = {};
    for (let i = 0; i < Math.floor(testList.length / 2); i++) {
      let title = testList[i * 2];
      let result = testList[i * 2 + 1];
      newMap[title] = result;
    }
    this.resultMap = newMap;
    fs.closeSync(opt);

    if (this.count === 1) {
      let params = router.getParams() as Record<string, string>;
      this.result = params['result'];
      let titles = params['title'];
      if (this.result === 'true ' || this.result === 'false') {
        this.resultMap[titles] = this.result;
        this.writeColorBack(titles, this.result,this.isConfigMode ? configColorBackPath : colorBackPath);
        this.fileWrite(this.result, titles, this.isConfigMode ? configTxtPath : txtPath);
      }
      this.count = 0;
    }
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back();
        })

        Row() {
          Text('IOT')
            .fontColor(Color.White)
            .fontSize('22fp')
        }.justifyContent(FlexAlign.SpaceAround)
        .backgroundColor(Color.Black)

        Row() {
          Button() {
            Image($r('app.media.ic_public_delete'))
              .width('30vp')
              .height('30vp')
          }.backgroundColor(Color.Black)
          .onClick(() => {
            AlertDialog.show(
              {
                message: '是否删除所有记录',
                primaryButton: {
                  value: 'Yes',
                  action: () => {
                    this.clearAll = true;
                    let clearedMap: Record<string, string> = {};
                    let keys = Object.keys(this.resultMap);
                    for (let i = 0; i < keys.length; i++) {
                      clearedMap[keys[i]] = 'none ';
                    }
                    this.resultMap = clearedMap;
                    this.clearText();
                    router.replaceUrl({
                      url: 'pages/IOT/IOT_index',
                    })
                    promptAction.showToast({
                      message: '结果已删除', duration: 1000
                    });
                  }
                },
                secondaryButton: {
                  value: 'No',
                  action: () => {

                  }
                },
                cancel: () => {

                }
              }
            )
          })

          Button() {
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.readTextParseXml();
            AlertDialog.show({
              message: `报告已生成，如需查看通过命令行输入'hdc file recv /data/app/el2/100/base/com.example.iotcvalidator/haps/entry/files/IOT/IOTConfigTest.xml -本地路径'`,
              confirm: {
                value: 'OK',
                action: () => {
                  promptAction.showToast({
                    message: '报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                promptAction.showToast({
                  message: '报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: '15vp' })
      .height('6%')
      .backgroundColor(Color.Black)

      List() {
        ForEach(this.filteredList, (item: PageCase, index) => {
          ListItem() {
            Row() {
              Text(item.title)
                .fontSize(20)
                .fontColor(Color.White)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .linearGradient({
              angle: 90,
              colors: [[this.getGradientColors(item.title)[0], 0.0], [this.getGradientColors(item.title)[1], 0.618]]
            })
            .onClick(() => {
              this.count = 1;
              this.clearAll = false;
              this.current = index;
              router.push({
                url: item.uri,
                params: { title: item.title }
              })
            })
          }
        }, (item: PageCase) => item.title)
        if (this.isConfigMode) {
          ListItem() {
            Row() {
              Button('自动执行用例')
                .height(44)
                .fontColor(Color.Black)
                .backgroundColor('#e1e5e8')
                .borderRadius(22)
                .fontSize(16)
                .onClick(() => {
                  router.pushUrl({ url: 'pages/IOT/IOT_execution' })
                });
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .padding({ top: 8, bottom: 16 });
          }
        }
      }
      .width('100%')
      .height('92%')
      .divider({ strokeWidth: 1, color: Color.Grey })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  clearText() {
    if (this.isConfigMode) {
      this.resetConfigColorFile();
      return;
    }
    fs.rmdirSync(iotPath);
    fs.mkdirSync(iotPath);
    fs.openSync(iotScanTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(colorTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fd = fs.openSync(colorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let clearedMap: Record<string, string> = {};
    for (let i = 0; i < this.filteredList.length; i++) {
      let log = (this.filteredList[i].title + ';' + 'none ' + ';').toString();
      fs.writeSync(fd.fd, log);
      clearedMap[this.filteredList[i].title] = 'none ';
    }
    this.resultMap = clearedMap;
    FlushData.resetIOT(getContext(this) as common.UIAbilityContext);
  }

  resetConfigColorFile() {
    try {
      fs.rmdirSync(iotPath);
    } catch (e) {
      Logger.error(TAG, `resetConfigColorFile error =${JSON.stringify(e)}`)
    }
    fs.mkdirSync(iotPath);
    let fd = fs.openSync(configColorBackPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    let clearedMap: Record<string, string> = {};
    for (let i = 0; i < this.filteredList.length; i++) {
      let log = `${this.filteredList[i].title};none ;`;
      fs.writeSync(fd.fd, log);
      clearedMap[this.filteredList[i].title] = 'none ';
    }
    fs.closeSync(fd);
    this.resultMap = clearedMap;
    let rptFd = fs.openSync(configTxtPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    fs.closeSync(rptFd);
  }

  readTextParseXml() {
    let dir = fs.listFileSync(iotPath);
    let reportPath = this.isConfigMode ? configTxtPath : txtPath;
    let xmlFilePath = this.isConfigMode ? configXmlPath : xmlPath;
    Logger.info(TAG, `readTextParseXml dir =${dir.join()}`);
    while (dir) {
      let OP = fs.openSync(reportPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(40960);
      let bufRD = fs.readSync(OP.fd, buf);
      Logger.info(TAG, `readTextParseXml bufRD =${bufRD}`);
      let report: string = String.fromCharCode(...new Uint8Array(buf));

      let str1 = report.split(';');
      let title: string[] = [];
      let result: string[] = [];
      for (let i = 0; i < Math.floor(str1.length / 2); i++) {
        title[i] = str1[i*2];
        result[i] = str1[i * 2+1];
      }
      let failIndex = report.indexOf('false');
      let testFailNum = 0;
      while (failIndex != -1) {
        testFailNum++;
        failIndex = report.indexOf('false', failIndex + 1);
      }
      let failNum = (testFailNum).toString();
      console.log(`iot failNum ${failNum}`);
      let passIndex = report.indexOf('true ');
      let testPassNum = 0;
      while (passIndex != -1) {
        testPassNum++;
        passIndex = report.indexOf('true ', passIndex + 1);
      }
      let testNum = testFailNum + testPassNum;
      console.log(`iot testNum ${testNum}`);
      let arrayBuffer = new ArrayBuffer(40960);
      let bufView = new DataView(arrayBuffer);
      let serializer = new xml.XmlSerializer(bufView);
      serializer.setDeclaration();
      serializer.startElement('testsuites');
      serializer.setAttributes('name', 'ActsValidatorIOT');
      serializer.setAttributes('errors', '0');
      serializer.setAttributes('disabled', '0');
      serializer.setAttributes('failures', failNum);
      serializer.setAttributes('tests', String(testNum));
      serializer.setAttributes('ignored', '0');
      serializer.setAttributes('unavailable', '0');
      serializer.startElement('testsuite');
      serializer.setAttributes('name', 'ActsIOTTest');
      serializer.setAttributes('time', '*');
      serializer.setAttributes('errors', '0');
      serializer.setAttributes('disabled', '0');
      serializer.setAttributes('failures', failNum);
      serializer.setAttributes('ignored', '0');
      serializer.setAttributes('tests', String(testNum));
      serializer.setAttributes('message', '*');
      serializer.setAttributes('modulename', 'ActsValidatorIOT');
      for (let i = 0; i < title.length; i++) {
        serializer.startElement('testcase');
        serializer.setAttributes('name', String(title[i]));
        serializer.setAttributes('status', 'run');
        serializer.setAttributes('time', '*');
        serializer.setAttributes('classname', 'ActsIOTTest');
        serializer.setAttributes('result', String(result[i]));
        serializer.setAttributes('level', '*');
        serializer.setAttributes('message', '*');
        serializer.endElement();
      }
      serializer.endElement();
      serializer.endElement();

      let that = new util.TextDecoder('utf-8');
      let array = new Uint8Array(arrayBuffer);
      let endPos = array.length;
      for (let i = 0; i < array.length; i++) {
        if (array[i] === 0) {
          endPos = i;
          break;
        }
      }
      let serializerStr = that.decode(array.slice(0, endPos));
      try {
        console.info(TAG, `read xmlPath =${xmlPath}`);
        let xmlfd = fs.openSync(xmlFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
        fs.writeSync(xmlfd.fd, serializerStr);
      } catch (err) {
        console.error(TAG, `read xmlPath =${xmlPath} error ${err.message}`);
      } finally {
        fs.closeSync(fs.openSync(xmlFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE));
      }
      return;
    }
  }

  fileWrite(results: string, titles: string, targetPath: string = txtPath) {
    let fd = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf = new ArrayBuffer(4096);
    let readBuff = fs.readSync(fd.fd, buf);
    let uint8Array = new Uint8Array(buf, 0, readBuff);
    let report = String.fromCharCode(...uint8Array);
    let number = titles.length + results.length + 2;
    let index: number = report.indexOf(titles);
    let logStr = `${titles};${results};`
    if (index == -1) {
      fs.writeSync(fd.fd, logStr);
    } else if (index != -1) {
      let key: string = report.substring(index, index + number);
      let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      report = report.replace(key, logStr);
      let buffer = new ArrayBuffer(4096);
      let rd = fs.readSync(file.fd, buffer);
      let reportSub: string = report.substring(0, rd);
      fs.closeSync(file);
      let fileFd = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(fileFd.fd, reportSub);
    }
  }

  writeColorBack(titles: string, result: string,targetPath: string = colorBackPath) {
    let fd = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf = new ArrayBuffer(40960);
    let readBytes = fs.readSync(fd.fd, buf);
    let content = String.fromCharCode(...new Uint8Array(buf, 0, readBytes));
    let logStr = `${titles};${result};`;
    let index = content.indexOf(titles);
    let newContent = '';
    if (index >= 0) {
      let oldEntryLen = titles.length + 7;
      let oldEntry = content.substring(index, index + oldEntryLen);
      if (content.indexOf(oldEntry) >= 0) {
        content = content.replace(oldEntry, logStr);
      }
      newContent = content;
    } else {
      newContent = content + logStr;
    }
    fs.closeSync(fd);
    fd = fs.openSync(targetPath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE|fs.OpenMode.TRUNC);
    fs.writeSync(fd.fd, newContent);
    fs.closeSync(fd);
  }

  getGradientColors(title: string): number[] {
    if (this.count === 0 && this.testTag === 0) {
      return [0x000000, 0x000000];
    }
    let result = this.resultMap[title];
    if (result === 'true ') {
      return [0x263526, 0x0CB60C];
    } else if (result === 'false') {
      return [0x380303, 0xd60a0a];
    }
    return [0x000000, 0x000000];
  }
}

