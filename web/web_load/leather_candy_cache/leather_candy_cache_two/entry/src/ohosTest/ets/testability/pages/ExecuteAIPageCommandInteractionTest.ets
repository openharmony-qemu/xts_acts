 import Utils from '../../test/Utils';
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

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.str = eventData.data.ACTION;
    }
  }

  private sleep(ms: number): Promise<void> {
    return new Promise((resolve: () => void) => {
      setTimeout(resolve, ms);
    });
  }

  private async runCommand(msg: string, runner: AIPageCommandRunner, command: string, eventId: number,
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
      let json: CommandResult = JSON.parse(res);
      Utils.emitEvent(json.code, eventId);
    } else if (errorCode !== -1) {
      Utils.emitEvent(errorCode, eventId);
    } else {
      Utils.emitEvent(-1, eventId);
    }
  }

  build() {
    Column() {
      Row() {
        Button('ExecuteAIPageCommandInteractionTest').key('InteractionTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          const runner: AIPageCommandRunner = this.controller as AIPageCommandRunner;
          const runnerNull: AIPageCommandRunner = this.controllerNull as AIPageCommandRunner;
          switch (this.str) {
            case 'testDispatchMouse001': {
              let msg = 'testDispatchMouse001';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148200);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148200);
              } else {
                Utils.emitEvent(-1, 148200);
              }
              break;
            }
            case 'testDispatchMouse002': {
              let msg = 'testDispatchMouse002';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand002);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148201);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148201);
              } else {
                Utils.emitEvent(-1, 148201);
              }
              break;
            }
            case 'testDispatchMouse003': {
              let msg = 'testDispatchMouse003';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand003);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148202);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148202);
              } else {
                Utils.emitEvent(-1, 148202);
              }
              break;
            }
            case 'testDispatchMouse004': {
              let msg = 'testDispatchMouse004';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand004);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148203);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148203);
              } else {
                Utils.emitEvent(-1, 148203);
              }
              break;
            }
            case 'testDispatchMouse005': {
              let msg = 'testDispatchMouse005';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand005);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148204);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148204);
              } else {
                Utils.emitEvent(-1, 148204);
              }
              break;
            }
            case 'testDispatchMouse006': {
              let msg = 'testDispatchMouse006';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchMouseCommand006);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148205);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148205);
              } else {
                Utils.emitEvent(-1, 148205);
              }
              break;
            }

            case 'testDispatchKey001': {
              let msg = 'testDispatchKey001';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148226);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148226);
              } else {
                Utils.emitEvent(-1, 148226);
              }
              break;
            }
            case 'testDispatchKey002': {
              let msg = 'testDispatchKey002';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand002);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148227);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148227);
              } else {
                Utils.emitEvent(-1, 148227);
              }
              break;
            }
            case 'testDispatchKey003': {
              let msg = 'testDispatchKey003';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand003);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148228);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148228);
              } else {
                Utils.emitEvent(-1, 148228);
              }
              break;
            }
            case 'testDispatchKey004': {
              let msg = 'testDispatchKey004';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand004);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148229);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148229);
              } else {
                Utils.emitEvent(-1, 148229);
              }
              break;
            }
            case 'testDispatchKey005': {
              let msg = 'testDispatchKey005';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand005);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148230);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148230);
              } else {
                Utils.emitEvent(-1, 148230);
              }
              break;
            }
            case 'testDispatchKey006': {
              let msg = 'testDispatchKey006';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(dispatchKeyCommand006);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148231);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148231);
              } else {
                Utils.emitEvent(-1, 148231);
              }
              break;
            }

            case 'testInput001': {
              let msg = 'testInput001';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148249);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148249);
              } else {
                Utils.emitEvent(-1, 148249);
              }
              break;
            }
            case 'testInput002': {
              let msg = 'testInput002';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand002);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148250);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148250);
              } else {
                Utils.emitEvent(-1, 148250);
              }
              break;
            }
            case 'testInput003': {
              let msg = 'testInput003';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand003);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148251);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148251);
              } else {
                Utils.emitEvent(-1, 148251);
              }
              break;
            }
            case 'testInput004': {
              let msg = 'testInput004';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand004);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148252);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148252);
              } else {
                Utils.emitEvent(-1, 148252);
              }
              break;
            }
            case 'testInput005': {
              let msg = 'testInput005';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand005);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148253);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148253);
              } else {
                Utils.emitEvent(-1, 148253);
              }
              break;
            }
            case 'testInput006': {
              let msg = 'testInput006';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand006);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148254);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148254);
              } else {
                Utils.emitEvent(-1, 148254);
              }
              break;
            }
            case 'testInput007': {
              let msg = 'testInput007';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand007);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148255);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148255);
              } else {
                Utils.emitEvent(-1, 148255);
              }
              break;
            }
            case 'testInput008': {
              let msg = 'testInput008';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand008);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148256);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148256);
              } else {
                Utils.emitEvent(-1, 148256);
              }
              break;
            }
            case 'testInput009': {
              let msg = 'testInput009';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand009);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148257);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148257);
              } else {
                Utils.emitEvent(-1, 148257);
              }
              break;
            }
            case 'testInput010': {
              let msg = 'testInput010';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand010);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148258);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148258);
              } else {
                Utils.emitEvent(-1, 148258);
              }
              break;
            }
            case 'testInput011': {
              let msg = 'testInput011';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand011);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148259);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148259);
              } else {
                Utils.emitEvent(-1, 148259);
              }
              break;
            }
            case 'testInput012': {
              let msg = 'testInput012';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand012);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148260);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148260);
              } else {
                Utils.emitEvent(-1, 148260);
              }
              break;
            }
            case 'testInput013': {
              let msg = 'testInput013';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(inputCommand013);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148261);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148261);
              } else {
                Utils.emitEvent(-1, 148261);
              }
              break;
            }

            case 'testScroll001': {
              let msg = 'testScroll001';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148271);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148271);
              } else {
                Utils.emitEvent(-1, 148271);
              }
              break;
            }
            case 'testScroll002': {
              let msg = 'testScroll002';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand002);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148272);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148272);
              } else {
                Utils.emitEvent(-1, 148272);
              }
              break;
            }
            case 'testScroll003': {
              let msg = 'testScroll003';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand003);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148273);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148273);
              } else {
                Utils.emitEvent(-1, 148273);
              }
              break;
            }
            case 'testScroll004': {
              let msg = 'testScroll004';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand004);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148274);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148274);
              } else {
                Utils.emitEvent(-1, 148274);
              }
              break;
            }
            case 'testScroll005': {
              let msg = 'testScroll005';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand005);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148275);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148275);
              } else {
                Utils.emitEvent(-1, 148275);
              }
              break;
            }
            case 'testScroll006': {
              let msg = 'testScroll006';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand006);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148276);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148276);
              } else {
                Utils.emitEvent(-1, 148276);
              }
              break;
            }
            case 'testScroll007': {
              let msg = 'testScroll007';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runnerNull.executeAIPageCommand(scrollCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = 132; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148277);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148277);
              } else {
                Utils.emitEvent(-1, 148277);
              }
              break;
            }
            case 'testScroll008': {
              let msg = 'testScroll008';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand008);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148278);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148278);
              } else {
                Utils.emitEvent(-1, 148278);
              }
              break;
            }
            case 'testScroll009': {
              let msg = 'testScroll009';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(scrollCommand009);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148279);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148279);
              } else {
                Utils.emitEvent(-1, 148279);
              }
              break;
            }

            case 'testSelect001': {
              let msg = 'testSelect001';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148280);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148280);
              } else {
                Utils.emitEvent(-1, 148280);
              }
              break;
            }
            case 'testSelect002': {
              let msg = 'testSelect002';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand002);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148281);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148281);
              } else {
                Utils.emitEvent(-1, 148281);
              }
              break;
            }
            case 'testSelect003': {
              let msg = 'testSelect003';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand003);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148282);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148282);
              } else {
                Utils.emitEvent(-1, 148282);
              }
              break;
            }
            case 'testSelect004': {
              let msg = 'testSelect004';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand004);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148283);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148283);
              } else {
                Utils.emitEvent(-1, 148283);
              }
              break;
            }
            case 'testSelect005': {
              let msg = 'testSelect005';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand005);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148284);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148284);
              } else {
                Utils.emitEvent(-1, 148284);
              }
              break;
            }
            case 'testSelect006': {
              let msg = 'testSelect006';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runnerNull.executeAIPageCommand(selectCommand001);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = 132; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148285);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148285);
              } else {
                Utils.emitEvent(-1, 148285);
              }
              break;
            }
            case 'testSelect007': {
              let msg = 'testSelect007';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand006);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148286);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148286);
              } else {
                Utils.emitEvent(-1, 148286);
              }
              break;
            }
            case 'testSelect008': {
              let msg = 'testSelect008';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand007);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148287);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148287);
              } else {
                Utils.emitEvent(-1, 148287);
              }
              break;
            }
            case 'testSelect009': {
              let msg = 'testSelect009';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand008);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148288);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148288);
              } else {
                Utils.emitEvent(-1, 148288);
              }
              break;
            }
            case 'testSelect010': {
              let msg = 'testSelect010';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand009);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148289);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148289);
              } else {
                Utils.emitEvent(-1, 148289);
              }
              break;
            }
            case 'testSelect011': {
              let msg = 'testSelect011';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand010);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148290);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148290);
              } else {
                Utils.emitEvent(-1, 148290);
              }
              break;
            }
            case 'testSelect012': {
              let msg = 'testSelect012';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand011);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148291);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148291);
              } else {
                Utils.emitEvent(-1, 148291);
              }
              break;
            }
            case 'testSelect013': {
              let msg = 'testSelect013';
              let res: string = '';
              let errorCode: number = -1;
              for (let i = 0; i < 5; i++) {
                try {
                  const result: Promise<string> | string = runner.executeAIPageCommand(selectCommand012);
                  res = typeof result === 'string' ? result : await result;
                  console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
                  if (res && res.includes('code')) { break; }
                } catch (error) {
                  console.error(msg + ' error: ' + error.code + ' message ' + error.message);
                  errorCode = error.code; res = '';
                }
                if (i < 4) { await this.sleep(500); }
              }
              if (res && res.includes('code')) {
                let json: CommandResult = JSON.parse(res);
                Utils.emitEvent(json.code, 148292);
              } else if (errorCode !== -1) {
                Utils.emitEvent(errorCode, 148292);
              } else {
                Utils.emitEvent(-1, 148292);
              }
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

          }
        })
      }
      Web({ src: 'resource://rawfile/ai_control_full_test.html', controller: this.controller })
        .width('100%')
        .height('100%')
    }
  }
}
