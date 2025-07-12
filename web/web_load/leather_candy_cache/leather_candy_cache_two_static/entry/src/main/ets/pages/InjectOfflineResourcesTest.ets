import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  Uint8Array
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';

interface ResourceConfig {
  urlList: string[],
  type: web_webview.OfflineResourceType,
  responseHeaders: web_webview.WebHeader[],
  localPath: string
}

@Entry
@Component
struct injectOfflineResourcesTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''
  resourceConfigs: ResourceConfig[] = [
    {
      localPath: 'icon.png',
      urlList: [
        '',
        '',
        '',
      ],
      type: web_webview.OfflineResourceType.IMAGE,
      responseHeaders: [
        { headerKey: 'Cache-Control', headerValue: 'max-age=1000' },
        { headerKey: 'Content-Type', headerValue: 'image/png' },
      ]
    },
    {
      localPath: 'test.js',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.CLASSIC_JS,
      responseHeaders: [
        { headerKey: 'Cross-Origin', headerValue: 'anonymous' }
      ]
    },
    {
      localPath: 'test.css',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.CSS,
      responseHeaders: [
        { headerKey: 'Content-Type', headerValue: 'css' },
      ]
    },
    {
      localPath: 'test.js',
      urlList: [
        '',
      ],
      type: web_webview.OfflineResourceType.MODULE_JS,
      responseHeaders: [
        { headerKey: 'Cross-Origin', headerValue: 'anonymous' }
      ]
    },
  ] as ResourceConfig[];

  readRawFile(url: string): Uint8Array {
    try {
      let context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext', Type.from<common.UIAbilityContext>());
      if (context) {
        return context.resourceManager.getRawFileContentSync(url);
      }
    } catch (err: BusinessError) {
      return new Uint8Array(0);
    }
    return new Uint8Array(0);
  }

  getData(): web_webview.OfflineResourceMap[] {
    const resourceMapArr: web_webview.OfflineResourceMap[] = [] as web_webview.OfflineResourceMap[];
    for (let config of this.resourceConfigs) {
      let buf: Uint8Array = new Uint8Array(0);
      if (config.localPath) {
        buf = this.readRawFile(config.localPath);
      }
      resourceMapArr.push({
        urlList: config.urlList,
        resource: buf,
        responseHeaders: config.responseHeaders,
        type: config.type,
      } as web_webview.OfflineResourceMap)
    }
    return resourceMapArr;
  }

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data?.['ACTION'] != null) {
        this.str = '' + eventData.data?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('injectOfflineResourcesTest click').key('injectOfflineResourcesTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testInjectOfflineResources001': {
              let msg = 'testInjectOfflineResources001'
              try {
                let resources: web_webview.OfflineResourceMap[] = this.getData();
                this.controller.injectOfflineResources(resources);
                setTimeout(() => {
                  Utils.emitEvent(true, 20001)
                }, 2000)
              } catch (err: BusinessError) {
                console.error(msg + ' error: ' + err.code + ' message ' + err.message);
                Utils.emitEvent(err.code, 20001)
              }
              break;
            }
            case 'testInjectOfflineResources002': {
              let msg = 'testInjectOfflineResources002'
              try {
                this.controller.injectOfflineResources([] as web_webview.OfflineResourceMap[]);
              } catch (err: BusinessError) {
                console.error(msg + ' error: ' + err.code + ' message ' + err.message);
                Utils.emitEvent(err.code, 20002)
              }
              break;
            }
            case 'testOfflineResourceType001': {
              let msg = 'testOfflineResourceType001'
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.MODULE_JS) + ' ' +
              number(web_webview.OfflineResourceType.MODULE_JS), 20003)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.CLASSIC_JS) + ' ' +
              number(web_webview.OfflineResourceType.CLASSIC_JS), 20004)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.CSS) + ' ' +
              number(web_webview.OfflineResourceType.CSS), 20005)
              Utils.emitEvent(Type.of(web_webview.OfflineResourceType.IMAGE) + ' ' +
              number(web_webview.OfflineResourceType.IMAGE), 20006)
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}