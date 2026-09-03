'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webview from '@ohos.web.webview'
import { Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';


const fullDomFunction0000: string = '{"method":"getFullDom","params":{"wants":["tag","text","content","rect","visible","hover","mouseover","mouseenter","title","aria-label","role","url","xpath","isInViewport",{"attributes":["id","class","href","src","role","aria-label","contenteditable","data-action","onclick","onmouseover","onmouseenter"]}]}}';
const fullDomFunction0001: string = '{"method":"getFullDom","params":{"wants":["id"]}}';
const fullDomFunction0002: string = '{"method":"getFullDom","params":{"wants":["tag"]}}';
const fullDomFunction0003: string = '{"method":"getFullDom","params":{"wants":["text"]}}';
const fullDomFunction0004: string = '{"method":"getFullDom","params":{"wants":["role"]}}';
const fullDomFunction0005: string = '{"method":"getFullDom","params":{"wants":["tag","text","content","rect","visible","hover","mouseover","mouseenter","title","aria-label","role","url","xpath","isInViewport"]}}';
const fullDomFunction0006: string = '{"method":"getFullDom","params":{"wants":["mouseenter", "invalidAttr", "mouseover"]}}';
const fullDomFunction0007: string = '{"method":"getFullDom","params":{"wants":[]}}';
const fullDomFunction0008: string = '{"method":"getFullDom","params":{"wants":"id"}}';
const fullDomFunction0009: string = '{"method":"getFullDom","params":{"wants":null}}';
const fullDomFunction0010: string = '{"method":"getFullDom"}';
const fullDomFunction0011: string = '{"method":"wrongMethod","params":{"wants":id}}';

const liteDomFunction0000: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"]},"wants":{"properties":["id","tag","text","xpath","rect","visible","clickable","scrollable","inputable","url","value","options","isInViewport"],"attributes":["id","class","href","src","aria-label","role"]}}}';
const liteDomFunction0001: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["id"]}}';
const liteDomFunction0002: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["tag"]}}';
const liteDomFunction0003: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["text"]}}';
const liteDomFunction0004: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["role"]}}';
const liteDomFunction0005: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["rect"]}}';
const liteDomFunction0006: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["bounds"]}}';
const liteDomFunction0007: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["visible"]}}';
const liteDomFunction0008: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["isInViewport"]}}';
const liteDomFunction0009: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["clickable"]}}';
const liteDomFunction0010: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"]},"wants":["role"]}}';
const liteDomFunction0011: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"isInViewport": false},"wants":["role"]}}';
const liteDomFunction0012: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"isInViewport": true},"wants":["role"]}}';
const liteDomFunction0013: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["title"]}}';
const liteDomFunction0014: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["aria-label"]}}';
const liteDomFunction0015: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["aria-label"]}}';
const liteDomFunction0016: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"visible": false},"wants":["role"]}}';
const liteDomFunction0017: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"visible": true},"wants":["text"]}}';
const liteDomFunction0018: string = '{"method":"getLiteDom","params":{"rules":{"tags":[],"attributes":{"class":"hidden"}},"wants":["id", "tag"]}}';
const liteDomFunction0019: string = '{"method":"getLiteDom","params":{"rules":{"tags":[],"role":["link", "searchbox"]},"wants":["id", "tag"]}}';
const liteDomFunction0020: string = '{"method":"getLiteDom","params":{"rules":{"tags":["unsupported_tag"]},"wants":["id", "tag"]}}';
const liteDomFunction0021: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["<script>alert(1)</script>"]}}';
const liteDomFunction0022: string = '{"method":"getLiteDom","params":{"rules":{"tags":["tag_nonExist"]},"wants":["id", "tag"]}}';
const liteDomFunction0023: string = '{"method":"getLiteDom","params":{"rules":{"tags":["tag_nonExist"]},"wants":["id", "tag"]}';
const liteDomFunction0024: string = '{"method":"","params":{"rules":{"tags":["button"]},"wants":["id", "tag"]}}';
const liteDomFunction0025: string = '{"method":"getLiteDom"}';

@Entry
@Component
struct ExecuteAIPageCommandTest {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''

  aboutToAppear() {
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 148188,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('valueChangeCallBack:' + JSON.stringify(eventData));
    const data = eventData.data as Record<string, RecordData>;
    if (data != null && data['ACTION'] != null) {
      let strValue: string = String(data['ACTION']);
      this.str = strValue;
    }
  }
  build() {
    Column() {
      Row() {
        Button('ExecuteAIPageCommandTest click').key('ExecuteAIPageCommandTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testExecuteAIPageCommand001': {
              let msg = 'testExecuteAIPageCommand001'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0001);
                Utils.emitEvent(true, 148111)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148111)
              }
              break;
            }
            case 'testExecuteAIPageCommand004': {
              let msg = 'testExecuteAIPageCommand004'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0002);
                Utils.emitEvent(true, 148114)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148114)
              }
              break;
            }
            case 'testExecuteAIPageCommand005': {
              let msg = 'testExecuteAIPageCommand005'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0003);
                Utils.emitEvent(true, 148115)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148115)
              }
              break;
            }
            case 'testExecuteAIPageCommand006': {
              let msg = 'testExecuteAIPageCommand006'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0004);
                Utils.emitEvent(true, 148116)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148116)
              }
              break;
            }
            case 'testExecuteAIPageCommand007': {
              let msg = 'testExecuteAIPageCommand007'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0005);
                Utils.emitEvent(true, 148117)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148117)
              }
              break;
            }
            case 'testExecuteAIPageCommand008': {
              let msg = 'testExecuteAIPageCommand008'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0000);
                Utils.emitEvent(true, 148118)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148118)
              }
              break;
            }
            case 'testExecuteAIPageCommand009': {
              let msg = 'testExecuteAIPageCommand009'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0006);
                Utils.emitEvent(true, 148119)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148119)
              }
              break;
            }
            case 'testExecuteAIPageCommand010': {
              let msg = 'testExecuteAIPageCommand010'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0007);
                Utils.emitEvent(true, 148120)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148120)
              }
              break;
            }
            case 'testExecuteAIPageCommand011': {
              let msg = 'testExecuteAIPageCommand011'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0008);
                Utils.emitEvent(true, 148121)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148121)
              }
              break;
            }
            case 'testExecuteAIPageCommand012': {
              let msg = 'testExecuteAIPageCommand012'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0009);
                Utils.emitEvent(true, 148122)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148122)
              }
              break;
            }
            case 'testExecuteAIPageCommand013': {
              let msg = 'testExecuteAIPageCommand013'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0010);
                Utils.emitEvent(true, 148123)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148123)
              }
              break;
            }
            case 'testExecuteAIPageCommand014': {
              let msg = 'testExecuteAIPageCommand014'
              try {
                this.controller.executeAIPageCommand(fullDomFunction0011);
                Utils.emitEvent(true, 148124)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148124)
              }
              break;
            }
            case 'testExecuteAIPageCommand015': {
              let msg = 'testExecuteAIPageCommand015'
              try {
                this.controller.executeAIPageCommand('');
                Utils.emitEvent(true, 148125)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148125)
              }
              break;
            }
            case 'testExecuteAIPageCommand016': {
              let msg = 'testExecuteAIPageCommand016'
              try {
                this.controller.executeAIPageCommand('not valid json');
                Utils.emitEvent(true, 148126)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148126)
              }
              break;
            }
            case 'testExecuteAIPageCommand017': {
              let msg = 'testExecuteAIPageCommand017'
              try {
                this.controllerNull.executeAIPageCommand(fullDomFunction0001);
                Utils.emitEvent(true, 148127)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148127)
              }
              break;
            }
            case 'testExecuteAIPageCommand018': {
              let msg = 'testExecuteAIPageCommand018'
              try {
                this.controller.executeAIPageCommand('{}');
                Utils.emitEvent(true, 148128)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148128)
              }
              break;
            }
            case 'testExecuteAIPageCommand019': {
              let msg = 'testExecuteAIPageCommand019'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0001);
                Utils.emitEvent(true, 148129)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148129)
              }
              break;
            }
            case 'testExecuteAIPageCommand020': {
              let msg = 'testExecuteAIPageCommand020'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0000);
                Utils.emitEvent(true, 148130)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148130)
              }
              break;
            }
            case 'testExecuteAIPageCommand021': {
              let msg = 'testExecuteAIPageCommand021'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0002);
                Utils.emitEvent(true, 148131)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148131)
              }
              break;
            }
            case 'testExecuteAIPageCommand022': {
              let msg = 'testExecuteAIPageCommand022'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0003);
                Utils.emitEvent(true, 148132)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148132)
              }
              break;
            }
            case 'testExecuteAIPageCommand023': {
              let msg = 'testExecuteAIPageCommand023'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0004);
                Utils.emitEvent(true, 148133)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148133)
              }
              break;
            }
            case 'testExecuteAIPageCommand024': {
              let msg = 'testExecuteAIPageCommand024'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0005);
                Utils.emitEvent(true, 148134)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148134)
              }
              break;
            }
            case 'testExecuteAIPageCommand025': {
              let msg = 'testExecuteAIPageCommand025'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0006);
                Utils.emitEvent(true, 148135)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148135)
              }
              break;
            }
            case 'testExecuteAIPageCommand026': {
              let msg = 'testExecuteAIPageCommand026'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0007);
                Utils.emitEvent(true, 148136)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148136)
              }
              break;
            }
            case 'testExecuteAIPageCommand027': {
              let msg = 'testExecuteAIPageCommand027'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0008);
                Utils.emitEvent(true, 148137)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148137)
              }
              break;
            }
            case 'testExecuteAIPageCommand028': {
              let msg = 'testExecuteAIPageCommand028'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0009);
                Utils.emitEvent(true, 148138)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148138)
              }
              break;
            }
            case 'testExecuteAIPageCommand029': {
              let msg = 'testExecuteAIPageCommand029'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0010);
                Utils.emitEvent(true, 148139)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148139)
              }
              break;
            }
            case 'testExecuteAIPageCommand030': {
              let msg = 'testExecuteAIPageCommand030'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0011);
                Utils.emitEvent(true, 148140)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148140)
              }
              break;
            }
            case 'testExecuteAIPageCommand031': {
              let msg = 'testExecuteAIPageCommand031'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0012);
                Utils.emitEvent(true, 148141)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148141)
              }
              break;
            }
            case 'testExecuteAIPageCommand032': {
              let msg = 'testExecuteAIPageCommand032'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0013);
                Utils.emitEvent(true, 148142)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148142)
              }
              break;
            }
            case 'testExecuteAIPageCommand033': {
              let msg = 'testExecuteAIPageCommand033'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0014);
                Utils.emitEvent(true, 148143)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148143)
              }
              break;
            }
            case 'testExecuteAIPageCommand034': {
              let msg = 'testExecuteAIPageCommand034'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0015);
                Utils.emitEvent(true, 148144)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148144)
              }
              break;
            }
            case 'testExecuteAIPageCommand035': {
              let msg = 'testExecuteAIPageCommand035'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0016);
                Utils.emitEvent(true, 148145)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148145)
              }
              break;
            }
            case 'testExecuteAIPageCommand036': {
              let msg = 'testExecuteAIPageCommand036'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0017);
                Utils.emitEvent(true, 148146)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148146)
              }
              break;
            }
            case 'testExecuteAIPageCommand037': {
              let msg = 'testExecuteAIPageCommand037'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0018);
                Utils.emitEvent(true, 148147)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148147)
              }
              break;
            }
            case 'testExecuteAIPageCommand038': {
              let msg = 'testExecuteAIPageCommand038'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0019);
                Utils.emitEvent(true, 148148)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148148)
              }
              break;
            }
            case 'testExecuteAIPageCommand039': {
              let msg = 'testExecuteAIPageCommand039'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0020);
                Utils.emitEvent(true, 148149)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148149)
              }
              break;
            }
            case 'testExecuteAIPageCommand040': {
              let msg = 'testExecuteAIPageCommand040'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0021);
                Utils.emitEvent(true, 148150)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148150)
              }
              break;
            }
            case 'testExecuteAIPageCommand041': {
              let msg = 'testExecuteAIPageCommand041'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0022);
                Utils.emitEvent(true, 148151)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148151)
              }
              break;
            }
            case 'testExecuteAIPageCommand042': {
              let msg = 'testExecuteAIPageCommand042'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0023);
                Utils.emitEvent(true, 148152)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148152)
              }
              break;
            }
            case 'testExecuteAIPageCommand043': {
              let msg = 'testExecuteAIPageCommand043'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0024);
                Utils.emitEvent(true, 148153)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148153)
              }
              break;
            }
            case 'testExecuteAIPageCommand044': {
              let msg = 'testExecuteAIPageCommand044'
              try {
                this.controller.executeAIPageCommand(liteDomFunction0025);
                Utils.emitEvent(true, 148154)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148154)
              }
              break;
            }
            case 'testExecuteAIPageCommand045': {
              let msg = 'testExecuteAIPageCommand045'
              try {
                this.controller.executeAIPageCommand(' ');
                Utils.emitEvent(true, 148155)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148155)
              }
              break;
            }
            case 'testExecuteAIPageCommand046': {
              let msg = 'testExecuteAIPageCommand046'
              try {
                this.controller.executeAIPageCommand('[]');
                Utils.emitEvent(true, 148156)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148156)
              }
              break;
            }
            case 'testExecuteAIPageCommand047': {
              let msg = 'testExecuteAIPageCommand047'
              try {
                this.controller.executeAIPageCommand('123');
                Utils.emitEvent(true, 148157)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148157)
              }
              break;
            }
          }
        })
      }
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}