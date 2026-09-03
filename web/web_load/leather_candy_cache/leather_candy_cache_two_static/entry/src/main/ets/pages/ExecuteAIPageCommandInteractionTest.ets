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
import { Callback } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

interface AIPageCommandRunner {
  executeAIPageCommand(command: string): Promise<string> | string;
}

interface CommandResult {
  code: number;
  message?: string;
  error?: string;
}

const dispatchMouseCommand001: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200}}';
const dispatchMouseCommand002: string = '{"method":"dispatchMouseEvent","params":{"type":"mouseWheel","x":100,"y":200,"deltaY":100}}';
const dispatchMouseCommand003: string = '{"method":"dispatchMouseEvent","params":{"type":"invalid","x":100,"y":200}}';

const dispatchKeyCommand001: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","key":"A"}}';
const dispatchKeyCommand002: string = '{"method":"dispatchKeyEvent","params":{"type":"invalid"}}';

const inputCommand001: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":"text","value":"NewValue"}}';
const inputCommand002: string = '{"method":"input","params":{"xpath":"//input[@id=\'age\']","type":"number","value":"25"}}';
const inputCommand003: string = '{"method":"input","params":{}}';
const inputCommand004: string = '{"method":"input","params":{"type":"text","value":"test"}}';

const scrollCommand001: string = '{"method":"scroll","params":{"x":180,"y":320,"deltaY":-200}}';
const scrollCommand002: string = '{"method":"scroll","params":{}}';
const scrollCommand003: string = '{"method":"scroll","params":{"x":100}}';

const selectCommand001: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","indexes":[1]}}';
const selectCommand002: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","values":["us"]}}';
const selectCommand003: string = '{"method":"select","params":{}}';

const dispatchMouseCommand004: string = '{"method":"dispatchMouseEvent","params":{"x":100,"y":200}}';
const dispatchKeyCommand003: string = '{"method":"dispatchKeyEvent","params":{"key":"A"}}';
const inputCommand005: string = '{"method":"input","params":{"xpath":123,"type":"text","value":"test"}}';
const inputCommand006: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":"text","value":123}}';
const inputCommand007: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":"unsupported_type","value":"test"}}';
const inputCommand008: string = '{"method":"input","params":{"xpath":"//input[@id=\'age\']","type":"number","value":"abc"}}';
const inputCommand009: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":"number","value":"123"}}';
const inputCommand010: string = '{"method":"input","params":{"id":"test","xpath":"//input[@id=\'username\']","type":"text","value":"test"}}';
const scrollCommand004: string = '{"method":"scroll","params":"notobject"}';
const scrollCommand005: string = '{"method":"scroll","params":{"id":"frameToken|documentToken|99999","deltaY":100}}';
const scrollCommand006: string = '{"method":"scroll","params":{"id":"nonexistent_id","deltaY":100}}';
const scrollCommand008: string = '{"method":"scroll","params":{"x":100,"y":200,"deltaY":100}}';
const scrollCommand009: string = '{"method":"scroll","params":{"x":100,"y":200,"speed":0}}';
const selectCommand004: string = '{"method":"select","params":"notobject"}';
const selectCommand005: string = '{"method":"select","params":{"xpath":"//select[@id=\'missing\']","indexes":[0]}}';
const selectCommand006: string = '{"method":"select","params":{"xpath":"//div[@id=\'not-select\']","indexes":[0]}}';
const selectCommand007: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","indexes":[],"values":[]}}';
const selectCommand008: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","indexes":[99]}}';
const selectCommand009: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","values":["nonexistent"]}}';
const selectCommand010: string = '{"method":"select","params":{"xpath":"//select[@id=\'country\']","indexes":[0,1]}}';
const selectCommand011: string = '{"method":"select","params":{"xpath":"//select[@id=\'disabled-country\']","indexes":[1]}}';
const selectCommand012: string = '{"method":"select","params":{"id":"test","xpath":"//select[@id=\'country\']","indexes":[0]}}';

const dispatchMouseCommand005: string = '{"method":"dispatchMouseEvent","params":{"type":"mouseReleased","x":100,"y":200}}';
const dispatchMouseCommand006: string = '{"method":"dispatchMouseEvent","params":{"type":"mouseMoved","x":100,"y":200}}';
const dispatchKeyCommand004: string = '{"method":"dispatchKeyEvent","params":{"type":"keyUp","key":"A"}}';
const dispatchKeyCommand005: string = '{"method":"dispatchKeyEvent","params":{"type":"rawKeyDown","key":"A"}}';
const dispatchKeyCommand006: string = '{"method":"dispatchKeyEvent","params":{"type":"char","key":"A"}}';
const inputCommand011: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":"default","value":"DefaultValue"}}';
const inputCommand012: string = '{"method":"input","params":{"xpath":"//input[@id=\'mail\']","type":"email","value":"test@example.com"}}';
const inputCommand013: string = '{"method":"input","params":{"xpath":"//input[@id=\'date-value\']","type":"date","value":"2026-07-13"}}';

const dispatchMouseCommand007: string = '{"method":"dispatchMouseEvent","params":"notobject"}';
const dispatchMouseCommand009: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100}}';
const dispatchMouseCommand010: string = '{"method":"dispatchMouseEvent","params":{"type":123,"x":100,"y":200}}';
const dispatchMouseCommand011: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":"abc","y":200}}';
const dispatchMouseCommand012: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":"abc"}}';
const dispatchMouseCommand013: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"timestamp":"abc"}}';
const dispatchMouseCommand014: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"force":"abc"}}';
const dispatchMouseCommand015: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"tangentialPressure":"abc"}}';
const dispatchMouseCommand016: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"tiltX":"abc"}}';
const dispatchMouseCommand017: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"tiltY":"abc"}}';
const dispatchMouseCommand018: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"deltaX":"abc"}}';
const dispatchMouseCommand019: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"deltaY":"abc"}}';
const dispatchMouseCommand020: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"modifiers":"abc"}}';
const dispatchMouseCommand021: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"buttons":"abc"}}';
const dispatchMouseCommand022: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"clickCount":"abc"}}';
const dispatchMouseCommand023: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"twist":"abc"}}';
const dispatchMouseCommand024: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"button":"invalid"}}';
const dispatchMouseCommand025: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"pointerType":123}}';
const dispatchMouseCommand026: string = '{"method":"dispatchMouseEvent","params":{"type":"mousePressed","x":100,"y":200,"pointerType":"touch"}}';

const dispatchKeyCommand007: string = '{"method":"dispatchKeyEvent","params":"notobject"}';
const dispatchKeyCommand009: string = '{"method":"dispatchKeyEvent","params":{"type":123}}';
const dispatchKeyCommand010: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","text":123}}';
const dispatchKeyCommand011: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","unmodifiedText":123}}';
const dispatchKeyCommand012: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","key":123}}';
const dispatchKeyCommand013: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","code":123}}';
const dispatchKeyCommand014: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","timestamp":"abc"}}';
const dispatchKeyCommand015: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","modifiers":"abc"}}';
const dispatchKeyCommand016: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","windowsVirtualKeyCode":"abc"}}';
const dispatchKeyCommand017: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","nativeVirtualKeyCode":"abc"}}';
const dispatchKeyCommand018: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","location":"abc"}}';
const dispatchKeyCommand019: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","autoRepeat":"abc"}}';
const dispatchKeyCommand020: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","isKeypad":"abc"}}';
const dispatchKeyCommand021: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","isSystemKey":"abc"}}';
const dispatchKeyCommand022: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","isForwarded":"abc"}}';
const dispatchKeyCommand023: string = '{"method":"dispatchKeyEvent","params":{"type":"keyDown","commands":"abc"}}';

const inputCommand014: string = '{"method":"input","params":"notobject"}';
const inputCommand015: string = '{"method":"input","params":{"xpath":"//input[@id=\'nonexistent\']","type":"text","value":"test"}}';
const inputCommand017: string = '{"method":"input","params":{"xpath":"//div[@id=\'content\']","type":"text","value":"test"}}';
const inputCommand018: string = '{"method":"input","params":{"xpath":"//input[@id=\'agree\']","type":"checkbox","value":"test"}}';
const inputCommand019: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","value":"test"}}';
const inputCommand020: string = '{"method":"input","params":{"id":123,"type":"text","value":"test"}}';
const inputCommand021: string = '{"method":"input","params":{"xpath":"","type":"text","value":"test"}}';
const inputCommand022: string = '{"method":"input","params":{"xpath":"//input[@id=\'username\']","type":123,"value":"test"}}';

@Entry
@Component
struct ExecuteAIPageCommandInteractionTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148188,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148188)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('valueChangeCallBack:' + JSON.stringify(eventData));
    if (eventData.data != null) {
      const data = eventData.data;
      if (data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  private sleep(ms: int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
      setTimeout(() => { resolve(Promise.resolve()); }, ms);
    });
  }

  private parseCode(res: string): number {
    let code: number = -1;
    try {
      const elem = JSON.parseJsonElement(res);
      const codeElem = elem.tryGetElement("code");
      if (codeElem !== undefined) {
        const codeDbl = codeElem.tryAsDouble();
        if (codeDbl !== undefined) {
          code = codeDbl;
        }
      }
    } catch (e) {
      console.error('parseCode error: ' + JSON.stringify(e));
    }
    return code;
  }

  private async runCommand(msg: string, runner: AIPageCommandRunner, command: string, eventId: Long,
    expectedError?: number): Promise<void> {
    let res: string = '';
    let errorCode: number = -1;
    for (let i = 0; i < 5; i++) {
      try {
        const result: Promise<string> | string = runner.executeAIPageCommand(command);
        res = typeof result === 'string' ? result : await result;
        console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
        if (res && res.includes('code')) { break; }
      } catch (error) {
        console.error(msg + ' error: ' + error.code + ' message ' + error.message);
        errorCode = expectedError !== undefined ? expectedError : error.code; res = '';
      }
      if (i < 4) { await this.sleep(500); }
    }
    if (res && res.includes('code')) {
      Utils.emitEvent(this.parseCode(res), eventId);
    } else if (errorCode !== -1) {
      Utils.emitEvent(errorCode, eventId);
    } else {
      Utils.emitEvent(-1, eventId);
    }
  }

  build() {
    Column() {
      Row() {
        Button('ExecuteAIPageCommandInteractionTest').key('InteractionTestButton').onClick((e: ClickEvent) => {
          (async () => {
          console.info('key==>' + this.str)
          const runner: AIPageCommandRunner = this.controller as AIPageCommandRunner;
          const runnerNull: AIPageCommandRunner = this.controllerNull as AIPageCommandRunner;
          switch (this.str) {
            case 'testDispatchMouse001': {
              await this.runCommand('testDispatchMouse001', runner, dispatchMouseCommand001, 148200);
              break;
            }
            case 'testDispatchMouse002': {
              await this.runCommand('testDispatchMouse002', runner, dispatchMouseCommand002, 148201);
              break;
            }
            case 'testDispatchMouse003': {
              await this.runCommand('testDispatchMouse003', runner, dispatchMouseCommand003, 148202);
              break;
            }
            case 'testDispatchMouse004': {
              await this.runCommand('testDispatchMouse004', runner, dispatchMouseCommand004, 148203);
              break;
            }
            case 'testDispatchMouse005': {
              await this.runCommand('testDispatchMouse005', runner, dispatchMouseCommand005, 148204);
              break;
            }
            case 'testDispatchMouse006': {
              await this.runCommand('testDispatchMouse006', runner, dispatchMouseCommand006, 148205);
              break;
            }
            case 'testDispatchMouse007': {
              await this.runCommand('testDispatchMouse007', runner, dispatchMouseCommand007, 148206);
              break;
            }
            case 'testDispatchMouse008': {
              await this.runCommand('testDispatchMouse008', runnerNull, dispatchMouseCommand001, 148207, 132);
              break;
            }
            case 'testDispatchMouse009': {
              await this.runCommand('testDispatchMouse009', runner, dispatchMouseCommand009, 148208);
              break;
            }
            case 'testDispatchMouse010': {
              await this.runCommand('testDispatchMouse010', runner, dispatchMouseCommand010, 148209);
              break;
            }
            case 'testDispatchMouse011': {
              await this.runCommand('testDispatchMouse011', runner, dispatchMouseCommand011, 148210);
              break;
            }
            case 'testDispatchMouse012': {
              await this.runCommand('testDispatchMouse012', runner, dispatchMouseCommand012, 148211);
              break;
            }
            case 'testDispatchMouse013': {
              await this.runCommand('testDispatchMouse013', runner, dispatchMouseCommand013, 148212);
              break;
            }
            case 'testDispatchMouse014': {
              await this.runCommand('testDispatchMouse014', runner, dispatchMouseCommand014, 148213);
              break;
            }
            case 'testDispatchMouse015': {
              await this.runCommand('testDispatchMouse015', runner, dispatchMouseCommand015, 148214);
              break;
            }
            case 'testDispatchMouse016': {
              await this.runCommand('testDispatchMouse016', runner, dispatchMouseCommand016, 148215);
              break;
            }
            case 'testDispatchMouse017': {
              await this.runCommand('testDispatchMouse017', runner, dispatchMouseCommand017, 148216);
              break;
            }
            case 'testDispatchMouse018': {
              await this.runCommand('testDispatchMouse018', runner, dispatchMouseCommand018, 148217);
              break;
            }
            case 'testDispatchMouse019': {
              await this.runCommand('testDispatchMouse019', runner, dispatchMouseCommand019, 148218);
              break;
            }
            case 'testDispatchMouse020': {
              await this.runCommand('testDispatchMouse020', runner, dispatchMouseCommand020, 148219);
              break;
            }
            case 'testDispatchMouse021': {
              await this.runCommand('testDispatchMouse021', runner, dispatchMouseCommand021, 148220);
              break;
            }
            case 'testDispatchMouse022': {
              await this.runCommand('testDispatchMouse022', runner, dispatchMouseCommand022, 148221);
              break;
            }
            case 'testDispatchMouse023': {
              await this.runCommand('testDispatchMouse023', runner, dispatchMouseCommand023, 148222);
              break;
            }
            case 'testDispatchMouse024': {
              await this.runCommand('testDispatchMouse024', runner, dispatchMouseCommand024, 148223);
              break;
            }
            case 'testDispatchMouse025': {
              await this.runCommand('testDispatchMouse025', runner, dispatchMouseCommand025, 148224);
              break;
            }
            case 'testDispatchMouse026': {
              await this.runCommand('testDispatchMouse026', runner, dispatchMouseCommand026, 148225);
              break;
            }

            case 'testDispatchKey001': {
              await this.runCommand('testDispatchKey001', runner, dispatchKeyCommand001, 148226);
              break;
            }
            case 'testDispatchKey002': {
              await this.runCommand('testDispatchKey002', runner, dispatchKeyCommand002, 148227);
              break;
            }
            case 'testDispatchKey003': {
              await this.runCommand('testDispatchKey003', runner, dispatchKeyCommand003, 148228);
              break;
            }
            case 'testDispatchKey004': {
              await this.runCommand('testDispatchKey004', runner, dispatchKeyCommand004, 148229);
              break;
            }
            case 'testDispatchKey005': {
              await this.runCommand('testDispatchKey005', runner, dispatchKeyCommand005, 148230);
              break;
            }
            case 'testDispatchKey006': {
              await this.runCommand('testDispatchKey006', runner, dispatchKeyCommand006, 148231);
              break;
            }
            case 'testDispatchKey007': {
              await this.runCommand('testDispatchKey007', runner, dispatchKeyCommand007, 148232);
              break;
            }
            case 'testDispatchKey008': {
              await this.runCommand('testDispatchKey008', runnerNull, dispatchKeyCommand001, 148233, 132);
              break;
            }
            case 'testDispatchKey009': {
              await this.runCommand('testDispatchKey009', runner, dispatchKeyCommand009, 148234);
              break;
            }
            case 'testDispatchKey010': {
              await this.runCommand('testDispatchKey010', runner, dispatchKeyCommand010, 148235);
              break;
            }
            case 'testDispatchKey011': {
              await this.runCommand('testDispatchKey011', runner, dispatchKeyCommand011, 148236);
              break;
            }
            case 'testDispatchKey012': {
              await this.runCommand('testDispatchKey012', runner, dispatchKeyCommand012, 148237);
              break;
            }
            case 'testDispatchKey013': {
              await this.runCommand('testDispatchKey013', runner, dispatchKeyCommand013, 148238);
              break;
            }
            case 'testDispatchKey014': {
              await this.runCommand('testDispatchKey014', runner, dispatchKeyCommand014, 148239);
              break;
            }
            case 'testDispatchKey015': {
              await this.runCommand('testDispatchKey015', runner, dispatchKeyCommand015, 148240);
              break;
            }
            case 'testDispatchKey016': {
              await this.runCommand('testDispatchKey016', runner, dispatchKeyCommand016, 148241);
              break;
            }
            case 'testDispatchKey017': {
              await this.runCommand('testDispatchKey017', runner, dispatchKeyCommand017, 148242);
              break;
            }
            case 'testDispatchKey018': {
              await this.runCommand('testDispatchKey018', runner, dispatchKeyCommand018, 148243);
              break;
            }
            case 'testDispatchKey019': {
              await this.runCommand('testDispatchKey019', runner, dispatchKeyCommand019, 148244);
              break;
            }
            case 'testDispatchKey020': {
              await this.runCommand('testDispatchKey020', runner, dispatchKeyCommand020, 148245);
              break;
            }
            case 'testDispatchKey021': {
              await this.runCommand('testDispatchKey021', runner, dispatchKeyCommand021, 148246);
              break;
            }
            case 'testDispatchKey022': {
              await this.runCommand('testDispatchKey022', runner, dispatchKeyCommand022, 148247);
              break;
            }
            case 'testDispatchKey023': {
              await this.runCommand('testDispatchKey023', runner, dispatchKeyCommand023, 148248);
              break;
            }

            case 'testInput001': {
              await this.runCommand('testInput001', runner, inputCommand001, 148249);
              break;
            }
            case 'testInput002': {
              await this.runCommand('testInput002', runner, inputCommand002, 148250);
              break;
            }
            case 'testInput003': {
              await this.runCommand('testInput003', runner, inputCommand003, 148251);
              break;
            }
            case 'testInput004': {
              await this.runCommand('testInput004', runner, inputCommand004, 148252);
              break;
            }
            case 'testInput005': {
              await this.runCommand('testInput005', runner, inputCommand005, 148253);
              break;
            }
            case 'testInput006': {
              await this.runCommand('testInput006', runner, inputCommand006, 148254);
              break;
            }
            case 'testInput007': {
              await this.runCommand('testInput007', runner, inputCommand007, 148255);
              break;
            }
            case 'testInput008': {
              await this.runCommand('testInput008', runner, inputCommand008, 148256);
              break;
            }
            case 'testInput009': {
              await this.runCommand('testInput009', runner, inputCommand009, 148257);
              break;
            }
            case 'testInput010': {
              await this.runCommand('testInput010', runner, inputCommand010, 148258);
              break;
            }
            case 'testInput011': {
              await this.runCommand('testInput011', runner, inputCommand011, 148259);
              break;
            }
            case 'testInput012': {
              await this.runCommand('testInput012', runner, inputCommand012, 148260);
              break;
            }
            case 'testInput013': {
              await this.runCommand('testInput013', runner, inputCommand013, 148261);
              break;
            }
            case 'testInput014': {
              await this.runCommand('testInput014', runner, inputCommand014, 148262);
              break;
            }
            case 'testInput015': {
              await this.runCommand('testInput015', runner, inputCommand015, 148263);
              break;
            }
            case 'testInput016': {
              await this.runCommand('testInput016', runnerNull, inputCommand001, 148264, 132);
              break;
            }
            case 'testInput017': {
              await this.runCommand('testInput017', runner, inputCommand017, 148265);
              break;
            }
            case 'testInput018': {
              await this.runCommand('testInput018', runner, inputCommand018, 148266);
              break;
            }
            case 'testInput019': {
              await this.runCommand('testInput019', runner, inputCommand019, 148267);
              break;
            }
            case 'testInput020': {
              await this.runCommand('testInput020', runner, inputCommand020, 148268);
              break;
            }
            case 'testInput021': {
              await this.runCommand('testInput021', runner, inputCommand021, 148269);
              break;
            }
            case 'testInput022': {
              await this.runCommand('testInput022', runner, inputCommand022, 148270);
              break;
            }

            case 'testScroll001': {
              await this.runCommand('testScroll001', runner, scrollCommand001, 148271);
              break;
            }
            case 'testScroll002': {
              await this.runCommand('testScroll002', runner, scrollCommand002, 148272);
              break;
            }
            case 'testScroll003': {
              await this.runCommand('testScroll003', runner, scrollCommand003, 148273);
              break;
            }
            case 'testScroll004': {
              await this.runCommand('testScroll004', runner, scrollCommand004, 148274);
              break;
            }
            case 'testScroll005': {
              await this.runCommand('testScroll005', runner, scrollCommand005, 148275);
              break;
            }
            case 'testScroll006': {
              await this.runCommand('testScroll006', runner, scrollCommand006, 148276);
              break;
            }
            case 'testScroll007': {
              await this.runCommand('testScroll007', runnerNull, scrollCommand001, 148277, 132);
              break;
            }
            case 'testScroll008': {
              await this.runCommand('testScroll008', runner, scrollCommand008, 148278);
              break;
            }
            case 'testScroll009': {
              await this.runCommand('testScroll009', runner, scrollCommand009, 148279);
              break;
            }

            case 'testSelect001': {
              await this.runCommand('testSelect001', runner, selectCommand001, 148280);
              break;
            }
            case 'testSelect002': {
              await this.runCommand('testSelect002', runner, selectCommand002, 148281);
              break;
            }
            case 'testSelect003': {
              await this.runCommand('testSelect003', runner, selectCommand003, 148282);
              break;
            }
            case 'testSelect004': {
              await this.runCommand('testSelect004', runner, selectCommand004, 148283);
              break;
            }
            case 'testSelect005': {
              await this.runCommand('testSelect005', runner, selectCommand005, 148284);
              break;
            }
            case 'testSelect006': {
              await this.runCommand('testSelect006', runnerNull, selectCommand001, 148285, 132);
              break;
            }
            case 'testSelect007': {
              await this.runCommand('testSelect007', runner, selectCommand006, 148286);
              break;
            }
            case 'testSelect008': {
              await this.runCommand('testSelect008', runner, selectCommand007, 148287);
              break;
            }
            case 'testSelect009': {
              await this.runCommand('testSelect009', runner, selectCommand008, 148288);
              break;
            }
            case 'testSelect010': {
              await this.runCommand('testSelect010', runner, selectCommand009, 148289);
              break;
            }
            case 'testSelect011': {
              await this.runCommand('testSelect011', runner, selectCommand010, 148290);
              break;
            }
            case 'testSelect012': {
              await this.runCommand('testSelect012', runner, selectCommand011, 148291);
              break;
            }
            case 'testSelect013': {
              await this.runCommand('testSelect013', runner, selectCommand012, 148292);
              break;
            }

          }
        })()
        })
      }
      Web({ src: 'resource://rawfile/ai_control_full_test.html', controller: this.controller })
        .width('100%')
        .height('100%')
    }
  }
}
